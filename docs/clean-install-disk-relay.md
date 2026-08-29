# クリーンインストール時のディスクリレーと `/nix` 移設

外付けストレージを使わず、既存の内蔵ディスクを一時的な避難先として使いながら、
NixOSをクリーンインストールする手順。

## 前提のディスク構成

| ディスク | 現在の用途 | 扱い |
| --- | --- | --- |
| `sda` | Windows 11 | 新NixOSのインストール先。最初に全消去する。 |
| `sdb` | 写真約600GB、既存NixOS領域約300GB | 最終的に500GiBを`/nix`、残りを`~/data`にする。 |
| `nvme0n1` | Steam約300GB、BMS曲約190GB | Steamを消した後、sdbを空にするための1TB避難先にする。 |

`/dev/sdX` は起動状況によって変わりうる。作業前とLive USB起動後の両方で、
容量・MODEL・SERIALを必ず確認する。

```fish
lsblk -o NAME,PATH,SIZE,MODEL,SERIAL,FSTYPE,LABEL,MOUNTPOINTS
```

## 全体像

```text
BMS: nvme0n1 -> sdb (照合)
新NixOS: sdaへ新規インストール
sdbの大事Data: sdb -> nvme0n1 (照合)
sdb: 全消去 -> 500GiB /nix + 残り ~/data
大事Data: nvme0n1 -> 新sdb ~/data (照合)
/nix: sda上の既存store -> 新sdb /nix
nvme0n1: Steam用として再利用
```

削除・フォーマットは、矢印のコピー先を照合してから行う。

## 0. Nix設定とdarktableを退避する

`nixx`の作業内容をコミットする。darktableのclosure、AIモデル、MIGraphXキャッシュは
別紙の[darktable + MIGraphX の退避と復元](darktable-migraphx-backup.md)に従って
`~/data/closure`へ保存する。

`~/data/closure`も、この後のsdbからnvmeへのデータ退避対象に含める。

## 1. BMS曲をsdbへ避難する

nvmeを避難先として使う前に、BMS曲をsdbのNTFSデータ領域内にコピーする。例えば
`reinstall-staging/bms/`を作る。

コピー後、内容まで照合する。

```fish
rsync -nrc --info=progress2 /BMSの現在地/ /sdb上の/reinstall-staging/bms/
```

この照合が差分なしになってから、Steamを削除してnvmeを空の避難先にする。BMSの元データは、
新環境での復元が完了するまで残しておく。

## 2. sdaへ新NixOSを仮住まいインストールする

`sda`だけを消去し、root・EFI・homeなどを作成して新NixOSをインストールする。

この時点では `/nix` もsda上に置く。sdbはデータを移すまで変更しない。

新環境でNixOS設定を評価・ビルドできること、Gitでnixxへアクセスできることを確認する。

## 3. sdbの大事Dataをnvmeへ避難する

nvmeに退避先ディレクトリを作り、写真、BMS、`~/data/closure`、必要なhomeデータをすべて
コピーする。

コピー完了後、各データセットでchecksum照合を行う。

```fish
rsync -nrc --info=progress2 /sdb上のデータ/ /nvme上の避難先/
```

照合が終わるまでsdbのパーティションを削除しない。ここで初めて、sdbの大事Dataは
二重化された状態になる。

## 4. sdbを最終レイアウトに作り直す

nvmeへの退避と照合を確認してから、sdbを全消去して以下を作成する。

| 領域 | 容量 | マウント先 |
| --- | --- | --- |
| sdbの第1領域（仮） | 500GiB | `/nix` |
| 残りの領域 | 残りすべて | `/home/mashu/data` |

ファイルシステムは好みのものを選び、NixOS設定ではデバイス名ではなくUUIDを指定する。
この段階では新しい`/nix`はまだ一時マウントだけにして、sda上の`/nix`を使い続ける。

## 5. データを新しいsdbへ戻す

新sdbのデータ領域を一時マウントし、nvmeから写真、BMS、closure、darktableのAIモデルと
MIGraphXキャッシュを戻す。戻した後も`rsync -nrc`で照合する。

この時点で写真・BMS・darktable退避セットが新sdbで読めることを確認する。

## 6. `/nix` をsdaからsdbへ移す

`/nix`をmountするだけではデータは移らない。mountするとsdaの`/nix`が隠れるだけなので、
先にNix store全体をコピーする。

### 6.1 新しい`/nix`を設定に追加する

新sdbの`/nix`領域を、一時マウント先（例: `/mnt/new-nix`）へmountする。
NixOS設定に、そのUUIDを使った`fileSystems."/nix"`を追加する。早い起動段階でもNix storeが
必要なので、`neededForBoot = true;`を指定する。

```nix
fileSystems."/nix" = {
  device = "/dev/disk/by-uuid/<new-nix-uuid>";
  fsType = "ext4";
  neededForBoot = true;
};
```

### 6.2 次回起動用のgenerationを作る

まだsdaの`/nix`を使ったまま、次回boot用のgenerationを作成する。

```fish
nh os boot
```

`switch`ではなく`boot`を使う。現在のセッションで新しい`/nix`をmount・有効化せず、
次回再起動からだけ使うため。

### 6.3 Nix storeをコピーして再起動する

この後はNixがstoreへ書き込まないよう、Nix関連コマンドを実行しない。Nix daemonを停止してから、
sda上の`/nix`を新sdbの一時マウント先へコピーする。

```fish
sudo systemctl stop nix-daemon.socket nix-daemon.service
sudo rsync -aHAX --numeric-ids --info=progress2 /nix/ /mnt/new-nix/
sync
sudo reboot
```

再起動後に、新しい`/nix`がsdbからmountされていることを確認する。

```fish
findmnt /nix
```

新しい`/nix`で起動でき、`nh os build`、darktable、raw denoiseが正常に動くまで、
sda上の古い`/nix`は削除しない。新しい`/nix`をmount中は古い方が隠れて見えないだけで、
まだsda上に残っている。

## 7. 最終確認とnvmeの再利用

以下をすべて確認してから、nvme上の避難データを削除してSteam用に再フォーマットする。

- 新sdbの写真とBMS曲を開ける
- `findmnt /nix` が意図したsdbのUUIDを示す
- `nh os build` が通る
- darktableのAIモデルが認識され、MIGraphXでraw denoiseが動作する
- `rsync -nrc` に差分がない

最後に、sda上の旧`/nix`をどう回収するかは、Live USBなどからsdaのrootを別mountして行う。
新環境の動作確認が完了するまでは削除しない。
