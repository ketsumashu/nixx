{ pkgs, ... }:
{
  programs.nixvim.plugins.bufferline = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      options = {
        alwaysShowBufferline = pkgs.lib.mkDefault true;
        offsets = [
          {
            filetype = "NvimTree";
            text = "Explorer";
            highlight = "NvimTreeNormal";
            padding = 1;
          }
        ];
      };
      settings.highlights =
        let
          bgColor = "#131313";
        in
        {
          # 1. 全体の背景
          fill = {
            bg = bgColor;
          };
          background = {
            bg = bgColor;
          };

          # 2. 選択中のタブ (文字色などを変えて識別は維持するのがおすすめ)
          bufferSelected = {
            bg = bgColor;
            bold = true;
            italic = true;
          };

          # 3. 非選択・可視タブ
          bufferVisible = {
            bg = bgColor;
          };

          # 4. 各種ボタンや修正アイコンの背景
          closeButton = {
            bg = bgColor;
          };
          closeButtonVisible = {
            bg = bgColor;
          };
          closeButtonSelected = {
            bg = bgColor;
          };
          modified = {
            bg = bgColor;
          };
          modifiedVisible = {
            bg = bgColor;
          };
          modifiedSelected = {
            bg = bgColor;
          };

          # 5. セパレーター（区切り線）
          separator = {
            fg = bgColor;
            bg = bgColor;
          };
          separatorVisible = {
            fg = bgColor;
            bg = bgColor;
          };
          separatorSelected = {
            fg = bgColor;
            bg = bgColor;
          };

          # 6. インジケータ（選択中のタブの端に出る線）
          indicatorSelected = {
            bg = bgColor;
          };

          # 7. サイドバーオフセット部分
          offsetSeparator = {
            bg = bgColor;
            fg = bgColor;
          };
        };
    };
  };
}
