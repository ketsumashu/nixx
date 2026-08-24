# Windows を廃止して NixOS と Linux ファイルシステムへ移行する手順

このメモは、このマシンの Windows を廃止し、NTFS の `/home/mashu/data` と
`/home/mashu/game` を Linux 向けファイルシステムへ移行するための作業記録である。

> **重要:** これは外付けディスクなしで行う「内蔵ディスクを一時退避先にする」手順である。
> ディスク故障、操作対象の取り違え、コピー不完全からは守れない。可能なら先に重要ファイルを
> 別PC・NAS・クラウドにも複製する。以下の各フェーズでコピー検証が終わるまで、コピー元を削除・
> フォーマットしないこと。

## 現在の構成（2026-08-24 に確認）

| ディスク | サイズ | 現在のパーティション | 用途 |
| --- | ---: | --- | --- |
| `/dev/sda` | 447 GiB | `sda1` EFI 100 MiB / `sda2` MSR 16 MiB / `sda3` NTFS 446 GiB / `sda4` NTFS 903 MiB | Windows 本体・回復領域 |
| `/dev/sdb` | 1.9 TiB | `sdb1` NTFS 1.5 TiB / `sdb4` ext4 232 GiB / `sdb2` EFI 1 GiB / `sdb3` ext4 97 GiB | data、develop、現行 NixOS の EFI と root |
| `/dev/nvme0n1` | 931 GiB | `nvme0n1p1` MSR 16 MiB / `nvme0n1p2` NTFS 931 GiB | game |

マウント先と概算使用量は以下。

| マウント先 | デバイス | 使用量 | 備考 |
| --- | --- | ---: | --- |
| `/` | `sdb3` ext4 | 45 GiB | 現行 NixOS root |
| `/boot` | `sdb2` FAT32 | 165 MiB | 現行 EFI System Partition |
| `/home/mashu/data` | `sdb1` NTFS | 637 GiB | 大事なデータ |
| `/home/mashu/develop` | `sdb4` ext4 | 37 GiB | 開発用 |
| `/home/mashu/game` | `nvme0n1p2` NTFS | 517 GiB | ゲーム用 |

`sdb` の物理的な並びは `sdb1 → sdb4 → sdb2 → sdb3` である。番号順ではないので、
パーティション番号だけで判断せず、必ずサイズ・UUID・マウント先も確認する。

## 最終目標

```text
sda       NixOS 専用
  ├─ EFI  1 GiB (FAT32)
  └─ /    残り全部 (Btrfs または ext4)

sdb       data 専用
  └─ /home/mashu/data ほぼ全体を 1 パーティション (Btrfs 推奨、ext4 でも可)

nvme0n1   game 専用
  └─ /home/mashu/game ほぼ全体を 1 パーティション (ext4 推奨)
```

一般データ用の `sdb` はスナップショットを使える Btrfs、ゲーム用 NVMe は扱いが単純な
ext4 を推奨する。Btrfs をゲーム用に使う場合は、ゲームデータを置くディレクトリで CoW を
無効化する設計を別途決める。

NTFS を ext4/Btrfs へ**インプレース変換する方法はない**。移行中にコピー先を作ってから、
コピー元の NTFS を作り直す必要がある。

## 絶対に守ること

- Windows の `sda` に必要なファイルや BitLocker 回復キーがないことを確認してから消す。
- パーティションの削除、NTFS 縮小、EFI 操作は、インストール済み NixOS ではなく Live USB
  から行う。作業中に対象ファイルシステムをマウントしない。
- `sda`、`sdb`、`nvme0n1` の名前は Live USB で変わる可能性がある。毎回 `lsblk -f` と
  `findmnt` でモデル・容量・UUID を確認する。
- コピー完了はファイル数ではなく、`rsync --checksum` を使った dry-run が空になることで確認する。
- コピー元を消す直前に、通常の差分同期をもう一度行う。作業中も NixOS を使うなら、変更中の
  データをコピーし終えた直後にもう一度同期する。
- ノートPCではAC電源を接続し、スリープ・休止を無効にする。

## 事前準備

1. NixOS のLive USBを作る。パーティション編集には GParted Live でもよいが、最終的な
   NixOS インストールを行える NixOS Live USB が必要。
2. Gitリポジトリをpush済みにする。このファイルを含む設定はLive USBで clone できる。
3. Windows が不要なのを最終確認する。`sda3` はWindows本体、`sda4` は回復領域である。
4. 現在の状態を保存する。以下は fish 向けの読み取り専用コマンド。

   ```fish
   lsblk -o NAME,PATH,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS
   findmnt -rno SOURCE,TARGET,FSTYPE,OPTIONS
   df -hT / /boot /home/mashu/data /home/mashu/develop /home/mashu/game
   ```

5. 退避用のマウント先を明示的に作る。以下の `<source>` と `<target>` は実際のパスへ置き換える。
   コピーには `cp -r` ではなく `rsync` を使う。

   ```fish
   rsync -aH --info=progress2 --partial <source>/ <target>/
   rsync -aHnci --delete <source>/ <target>/
   ```

   2行目は確認専用で、何も表示されなければ内容は一致している。表示があれば原因を確認し、
   再同期するまで次へ進まない。

## フェーズ 1: `sda` を一時退避ディスクにする

1. Live USB から起動する。
2. `lsblk -f` で **447 GiB の KIOXIA SATA SSD が `sda`** であることを再確認する。
3. `sda1`〜`sda4`（Windows EFI/MSR/本体/回復）をすべて削除する。
4. `sda` 全体に一時退避用の ext4 パーティションを1つ作り、例として `stage-sda` とラベル付けする。
5. いったん通常の NixOS へ起動し、`/home/mashu/data` のうち約400 GiBを `stage-sda` へコピーして検証する。

この時点では、コピー済みの約400 GiBは `stage-sda` と元のNTFSの**両方**に存在する。元データは消さない。

## フェーズ 2: `/data` を NTFS から退避して作り直す

`/data` は637 GiB使用中のため、447 GiBの `sda` だけでは全量を保持できない。`sdb1` を縮小して
一時領域を作ることで、内蔵ディスクだけで退避する。

1. Live USB を起動し、`sdb1` がアンマウントであることを確認する。
2. GParted または `ntfsresize` で `sdb1` をおよそ410 GiB以上縮小する。
   - 先に約400 GiBを `sda` に退避しているので、縮小後の `sdb1` に残る約237 GiBは収まる。
   - NTFS縮小が完了するまで `sdb4`、`sdb2`、`sdb3` は動かさない。
3. `sdb1` の直後にできた空き領域に、約410 GiBの一時 ext4 パーティションを作る。
   現在の番号構成では `sdb5` になり得るが、番号を前提にせずラベル `stage-sdb` を付ける。
4. 通常のNixOSを起動し、`stage-sda` に置いた約400 GiBを `stage-sdb` へコピー・検証する。
5. 空いた `stage-sda` へ、`sdb1` に残っている `/data` の残り約237 GiBをコピー・検証する。
6. `/data` の全量が `stage-sdb` と `stage-sda` に検証済みで存在することを確認する。
7. Live USBから、旧 `sdb1` のNTFSを削除し、新しい ext4/Btrfs パーティションとして作成する。
   この時点では容量は縮小後のサイズでよい。ラベルは例として `data` にする。
8. `stage-sdb` と `stage-sda` のデータを新しい `data` へ戻し、2つのコピー元と突き合わせて検証する。

このフェーズの終了時点で `/data` はLinuxファイルシステムになり、`stage-sda` と `stage-sdb` は空にできる。
ただし `sdb` を後で1パーティションへ整理するまでは、`stage-sdb` を削除しない。

## フェーズ 3: `/game` を NTFS から ext4 へ移行する

`/game` は517 GiB使用中なので、空になった `stage-sda`（約447 GiB）と `stage-sdb`（約410 GiB）へ
分割して退避する。

1. `/game` を `stage-sda` と `stage-sdb` に分けてコピーし、それぞれ検証する。
2. Live USBから `nvme0n1p2` のNTFSを削除して、ext4を作成する。Windowsを完全廃止するなら
   `nvme0n1p1` の16 MiB MSRも不要なので、最終的にはディスク先頭から作り直してよい。
3. 新しいゲーム用ext4を `/home/mashu/game` に一時マウントし、退避したゲームデータを戻して検証する。
4. Steamなどのランチャーを起動する前に、ライブラリの認識と読み取り権限を確認する。

## フェーズ 4: NixOS を `sda` へ移す

1. `sda` の一時退避データが完全に不要になったことを確認してから、`sda` を作り直す。
2. `sda` にEFI System Partition（FAT32、1 GiB）とroot用パーティション（残り）を作る。
3. rootは Btrfs または ext4 で作成する。Btrfsを選ぶ場合も、最初は複雑なサブボリューム構成にせず、
   必要なものだけにする。
4. Live USBで新rootとEFIを `/mnt`、`/mnt/boot` にマウントする。
5. このリポジトリの `nixos/system.nix` の `fileSystems` を、新しい `sda` のUUIDと最終的な
   data/game のUUIDへ更新する。`/home/mashu/develop` は `sda` のroot配下へ置くなら、その
   個別マウント定義を削除する。
6. `nixos-install --flake <このリポジトリ>#mashu-nix-101` で新しいrootにインストールする。
   インストール前に、旧rootの `/home/mashu` と必要な作業ディレクトリ・SSH鍵・ローカル設定を
   新rootへコピーする。`/home/mashu/data`、`game`、`develop` は別マウントなので別途扱う。
7. 新しい `sda` から起動できること、data/gameが意図したUUIDでマウントされること、NixOSの
   再ビルドが通ることを確認する。

> 現行の `/boot` には GRUB と systemd-boot のファイルが混在している。移行時にはブートローダを
> 一つに決める。この設定は現在 GRUB を有効化しているため、特別な理由がなければ GRUB に統一する。

## フェーズ 5: `sdb` をデータ専用の1パーティションへ整理する

これは **`sda` から新NixOSが起動できることを複数回確認してから** 行う。

1. `/home/mashu/develop` を `sda` のroot配下へ移し、旧 `sdb4` を使わなくする。
2. `data` の内容を、空の `stage-sda` と `stage-sdb` へ再度分割退避して検証する。
   dataは637 GiB、2つの一時領域の合計は約857 GiBなので収まる。
3. Live USBから `sdb` の旧data、stage、develop、旧EFI、旧rootをすべて削除する。
4. `sdb` の全体にデータ用の1パーティションを作成し、ext4/Btrfsでフォーマットする。
5. dataを戻して検証し、NixOS設定のUUIDを更新して `nixos-rebuild switch --flake .#mashu-nix-101`
   を実行する。

これで `sdb` に残る「`sdb1 → sdb4 → sdb2 → sdb3`」という増築履歴は消え、役割ごとに
ディスクが分かれた構成になる。

## 各フェーズの完了チェック

次の全てを満たすまで、次の破壊的操作へ進まない。

```fish
lsblk -f
findmnt -rno SOURCE,TARGET,FSTYPE,OPTIONS
df -hT / /boot /home/mashu/data /home/mashu/game
sudo nixos-rebuild dry-build --flake .#mashu-nix-101
```

- 退避先に対する `rsync -aHnci --delete` の出力が空。
- 退避先・復元先とも、ランダムにファイルを開いて内容を確認できる。
- 対象のファイルシステムをフォーマットする直前に、コピー元とコピー先をもう一度声に出して確認する。
- 新しいNixOS rootでは、再起動を少なくとも一度成功させる。

## 中断した場合の原則

- 退避コピーの途中なら、コピー元はまだ消さず、同じ `rsync` コマンドを再実行して再開する。
- UUIDが変わった後に起動できない場合はLive USBから起動し、`nixos/system.nix` の `fileSystems` と
  実際の `lsblk -f` を照合する。
- EFI起動が不安定でも、旧 `sdb` のEFIを消すのは新 `sda` のNixOSが安定起動してからにする。
- どのデータがどこにあるか自信がなくなった時点でフォーマットを止め、`findmnt`、`lsblk -f`、
  `rsync --dry-run --checksum` で所在を再確認する。
