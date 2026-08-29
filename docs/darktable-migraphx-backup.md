# darktable + MIGraphX の退避と復元

AI有効化済みのdarktable 5.6.1、ROCm/MIGraphX対応ONNX Runtime、MIGraphXパッチを含む
Nix closureを、クリーンインストールやGC後に再ビルドせず復元するための手順。

この設定では `nixpkgs-darktable` が専用inputとして固定されている。通常の
`nix flake update` で通常の `nixpkgs` を更新しても、darktableの評価結果は変わらない。

## 保存するもの

次の3つを揃えて保存する。

1. Nix binary cache
   - darktable本体、ONNX Runtime、パッチ済みMIGraphX、ROCm依存を含むclosure。
2. AIモデル
   - `~/.local/share/darktable/models/`
3. MIGraphXのコンパイル済みグラフキャッシュ
   - `~/.cache/darktable/ai_v*_migraphx_*`
   - これがない場合でも動作するが、各モデルの最初の実行時にMIGraphXのグラフコンパイルをやり直す。

Nix設定（`flake.nix`、`flake.lock`、`overlay/default.nix`、
`pkgs/migraphx-no-tensorflow-api.patch`）もGitにコミットしておく。

## 退避

以下では保存先を `~/data/closure` とする。外付けディスクを使う場合は、先にそこへ
マウントしてから実行する。

```fish
mkdir -p ~/data/closure

set darktable_path (readlink -f (command -s darktable))
nix copy --to 'file:///home/mashu/data/closure/nix-cache-darktable-migraphx?compression=zstd' $darktable_path

cp -a ~/.local/share/darktable/models ~/data/closure/darktable-models

mkdir -p ~/data/closure/darktable-migraphx-cache
find ~/.cache/darktable -maxdepth 1 -mindepth 1 -type d -name 'ai_v*_migraphx_*' -exec cp -a -t ~/data/closure/darktable-migraphx-cache {} +
```

`nix copy` は指定したdarktable実行ファイルだけでなく、その実行に必要なNix store
closureをすべて保存する。保存先のbinary cacheは、通常のGCでは影響を受けない。

## クリーンインストール後の復元

1. `nixx` を、darktable専用pinとMIGraphXパッチを含むコミットへ戻す。通常の
   `nixpkgs` やほかのflake inputは、より新しい状態のままでよい。
2. 保存先を再び `~/data/closure` として利用可能にする。
3. closure、AIモデル、MIGraphXキャッシュを復元する。

```fish
nix copy --all --from file:///home/mashu/data/closure/nix-cache-darktable-migraphx

mkdir -p ~/.local/share/darktable ~/.cache/darktable
cp -a ~/data/closure/darktable-models/. ~/.local/share/darktable/models/
cp -a ~/data/closure/darktable-migraphx-cache/. ~/.cache/darktable/
```

4. NixOS設定を有効化する。

```fish
nh os switch
```

closureを先にimportしてからswitchすることで、同じdarktable用pinから評価される
store pathをNixが既存の完成品として使う。darktable/MIGraphXの再ビルドは発生しない。

## 確認

専用pinが維持されていることを確認する。

```fish
jq -r '.nodes["nixpkgs-darktable"].locked.rev' flake.lock
```

現在の固定値は以下。

```text
9fbb54b33e91ee4ca368e35a78e0613c720600b3
```

`nh os build` でdarktableやMIGraphXがビルド対象に出なければ、closureが再利用されている。

## 更新時の挙動

- 通常の `nix flake update` は、branchを追う通常の `nixpkgs` や他inputを更新する。
- `nixpkgs-darktable` は完全なcommit hashを指定しているため、更新後も固定されたまま。
- 意図して `nixpkgs-darktable`、darktableソース、MIGraphXパッチを変更した場合だけ、
  darktable用derivationが変わり、新しいclosureのビルドまたは取得が必要になる。
