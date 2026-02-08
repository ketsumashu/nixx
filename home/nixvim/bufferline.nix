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
        highlights =
          let
            bg = "#131313";
          in
          {
            # 全てのキーに BufferLine を付与
            BufferLineFill = {
              bg = bg;
            };
            BufferLineBackground = {
              bg = bg;
            };

            # 選択中のタブ
            BufferLineBufferSelected = {
              bg = bg;
              bold = true;
            };
            BufferLineSeparatorSelected = {
              bg = bg;
              fg = bg;
            };
            BufferLineIndicatorSelected = {
              bg = bg;
            };
            BufferLineModifiedSelected = {
              bg = bg;
            };
            BufferLineCloseButtonSelected = {
              bg = bg;
            };

            # 非アクティブだが見えているタブ
            BufferLineBufferVisible = {
              bg = bg;
            };
            BufferLineSeparatorVisible = {
              bg = bg;
              fg = bg;
            };
            BufferLineModifiedVisible = {
              bg = bg;
            };
            BufferLineCloseButtonVisible = {
              bg = bg;
            };

            # 通常のセパレーター
            BufferLineSeparator = {
              bg = bg;
              fg = bg;
            };

            # オフセット（サイドバーとの境界）
            BufferLineOffsetSeparator = {
              bg = bg;
              fg = bg;
            };
          };
      };
    };
  };
}
