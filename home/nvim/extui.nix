{
  programs.nixvim.extraConfigVim = ''
local ok, extui = pcall(require, 'vim._extui')
if ok then
  extui.enable({
    enable = true, -- extuiを有効化
    msg = {
      pos = 'cmd', -- 'box'か'cmd'だがcmdheight=0だとどっちでも良い？（記事後述）
      box = {
        timeout = 5000, -- boxメッセージの表示時間 ミリ秒
      },
    },
  })
end
  '';
}
