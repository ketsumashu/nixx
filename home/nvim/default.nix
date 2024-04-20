{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./telescope.nix
    ./statusline.nix
    ./surround.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.poimandres.enable = true;
    colorschemes.poimandres.settings = {
      disable_background = true;
      disable_float_background = true;
      disable_italics = true;
    };
  };
}


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.013  000.013: --- NVIM STARTING ---
000.148  000.135: event init
000.239  000.090: early init
000.313  000.074: locale set
000.353  000.040: init first window
000.601  000.248: inits 1
000.615  000.014: window checked
000.616  000.002: parsing arguments
000.985  000.040  000.040: require('vim.shared')
001.130  000.035  000.035: require('vim._options')
001.132  000.145  000.110: require('vim._editor')
001.133  000.204  000.019: require('vim._init_packages')
001.135  000.314: init lua interpreter
001.233  000.098: expanding arguments
001.271  000.038: inits 2
001.472  000.201: init highlight
001.473  000.001: waiting for UI
001.763  000.290: done waiting for UI
001.777  000.014: clear screen
001.899  000.122: init default mappings & autocommands
001.972  000.073: --cmd commands
014.501  000.059  000.059: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/ftplugin.vim
016.677  000.047  000.047: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/indent.vim
017.608  000.163  000.163: require('poimandres.utils')
017.611  000.428  000.265: require('poimandres')
017.843  000.044  000.044: require('vim.loader')
020.714  000.626  000.626: require('poimandres.theme')
020.850  000.133  000.133: require('poimandres.palette')
022.741  002.677  001.918: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/poimandres.nvim/colors/poimandres.lua
023.160  000.194  000.194: require('telescope._extensions')
023.165  000.405  000.211: require('telescope')
025.579  000.280  000.280: require('plenary.bit')
025.749  000.167  000.167: require('plenary.functional')
025.792  000.027  000.027: require('ffi')
025.821  001.121  000.647: require('plenary.path')
025.835  001.352  000.232: require('plenary.strings')
025.984  000.147  000.147: require('telescope.deprecated')
026.937  000.007  000.007: require('vim.F')
026.970  000.332  000.325: require('plenary.log')
027.024  000.529  000.197: require('telescope.log')
028.079  000.368  000.368: require('plenary.job')
028.242  000.160  000.160: require('telescope.state')
028.254  001.229  000.701: require('telescope.utils')
028.258  002.272  000.515: require('telescope.sorters')
028.299  000.030  000.030: require('vim.inspect')
029.434  005.326  001.525: require('telescope.config')
029.989  000.242  000.242: require('plenary.window.border')
030.109  000.118  000.118: require('plenary.window')
030.236  000.126  000.126: require('plenary.popup.utils')
030.239  000.802  000.317: require('plenary.popup')
030.416  000.176  000.176: require('telescope.pickers.scroller')
030.571  000.153  000.153: require('telescope.actions.state')
030.779  000.206  000.206: require('telescope.actions.utils')
031.294  000.232  000.232: require('telescope.actions.mt')
031.316  000.536  000.304: require('telescope.actions.set')
031.751  000.229  000.229: require('telescope.config.resolve')
031.754  000.436  000.207: require('telescope.pickers.entry_display')
031.903  000.148  000.148: require('telescope.from_entry')
032.148  008.980  001.197: require('telescope.actions')
034.464  000.427  000.427: require('telescope._extensions.file_browser.utils')
035.864  001.396  001.396: require('plenary.scandir')
036.550  000.119  000.119: require('plenary.tbl')
036.557  000.267  000.148: require('plenary.vararg.rotate')
036.559  000.388  000.121: require('plenary.vararg')
036.690  000.131  000.131: require('plenary.errors')
036.695  000.682  000.162: require('plenary.async.async')
037.349  000.156  000.156: require('plenary.async.structs')
037.358  000.353  000.197: require('plenary.async.control')
037.363  000.527  000.175: require('plenary.async.util')
037.364  000.667  000.139: require('plenary.async.tests')
037.366  001.499  000.151: require('plenary.async')
037.426  004.180  000.858: require('telescope._extensions.file_browser.actions')
038.168  000.178  000.178: require('telescope._extensions.file_browser.git')
038.347  000.151  000.151: require('telescope._extensions.file_browser.make_entry_utils')
038.525  000.176  000.176: require('telescope._extensions.file_browser.fs_stat')
038.528  000.806  000.301: require('telescope._extensions.file_browser.make_entry')
039.110  000.131  000.131: require('plenary.class')
039.122  000.403  000.272: require('telescope._')
039.910  000.787  000.787: require('telescope.make_entry')
039.913  001.383  000.194: require('telescope.finders.async_oneshot_finder')
040.366  000.222  000.222: require('telescope.finders.async_static_finder')
040.536  000.167  000.167: require('telescope.finders.async_job_finder')
040.540  000.626  000.237: require('telescope.finders')
040.614  003.186  000.370: require('telescope._extensions.file_browser.finders')
041.940  000.215  000.215: require('telescope.debounce')
042.252  000.309  000.309: require('telescope.mappings')
042.473  000.218  000.218: require('telescope.pickers.highlights')
042.626  000.151  000.151: require('telescope.pickers.window')
042.804  000.177  000.177: require('telescope.pickers.layout')
043.240  000.224  000.224: require('telescope.algos.linked_list')
043.244  000.438  000.214: require('telescope.entry_manager')
043.408  000.163  000.163: require('telescope.pickers.multi')
043.426  002.628  000.958: require('telescope.pickers')
043.428  002.813  000.185: require('telescope._extensions.file_browser.picker')
043.637  000.207  000.207: require('telescope._extensions.file_browser.config')
043.642  010.582  000.196: require('telescope._extensions.file_browser')
045.082  000.080  000.080: require('luasnip.util.types')
045.162  000.077  000.077: require('luasnip.util.lazy_table')
045.286  000.122  000.122: require('luasnip.extras.filetype_functions')
045.307  000.498  000.220: require('luasnip.default_config')
045.310  000.600  000.102: require('luasnip.session')
045.321  000.940  000.339: require('luasnip.util.util')
045.874  000.144  000.144: require('luasnip.util.ext_opts')
045.971  000.094  000.094: require('luasnip.nodes.key_indexer')
045.981  000.658  000.420: require('luasnip.nodes.util')
046.343  000.093  000.093: require('luasnip.session.snippet_collection.source')
046.441  000.096  000.096: require('luasnip.util.table')
046.554  000.111  000.111: require('luasnip.util.auto_table')
046.567  000.585  000.285: require('luasnip.session.snippet_collection')
047.135  000.171  000.171: require('luasnip.util.select')
047.231  000.093  000.093: require('luasnip.util.time')
047.672  000.921  000.656: require('luasnip.util._builtin_vars')
047.738  001.170  000.249: require('luasnip.util.environ')
047.862  000.121  000.121: require('luasnip.util.extend_decorator')
048.424  000.320  000.320: require('luasnip.util.path')
048.982  000.238  000.238: require('luasnip.util.log')
048.990  000.562  000.324: require('luasnip.loaders.util')
049.118  000.126  000.126: require('luasnip.loaders.data')
049.685  000.564  000.564: require('luasnip.loaders.fs_watchers')
049.698  001.834  000.262: require('luasnip.loaders')
049.933  000.205  000.205: require('luasnip.config')
049.937  006.071  000.558: require('luasnip')
053.082  002.093  002.093: require('vim.lsp.log')
053.094  002.449  000.356: require('lsp-format')
056.538  000.594  000.594: require('vim.lsp.protocol')
058.004  000.396  000.396: require('vim.lsp._snippet')
058.262  000.255  000.255: require('vim.highlight')
058.277  001.735  001.084: require('vim.lsp.util')
058.286  002.878  000.549: require('vim.lsp.handlers')
058.784  000.496  000.496: require('vim.lsp.rpc')
059.062  000.276  000.276: require('vim.lsp.sync')
059.507  000.443  000.443: require('vim.lsp.semantic_tokens')
059.984  000.474  000.474: require('vim.lsp.buf')
060.259  000.272  000.272: require('vim.lsp.diagnostic')
060.544  000.283  000.283: require('vim.lsp.codelens')
060.600  007.484  002.362: require('vim.lsp')
060.859  000.097  000.097: require('cmp_nvim_lsp.source')
060.862  000.220  000.122: require('cmp_nvim_lsp')
061.797  000.360  000.360: require('lspconfig.util')
061.929  000.129  000.129: require('lspconfig.async')
061.953  000.764  000.275: require('lspconfig.configs')
061.955  000.893  000.130: require('lspconfig')
062.056  000.099  000.099: require('lspconfig.server_configurations.nixd')
062.869  000.250  000.250: require('lspconfig.manager')
062.984  000.108  000.108: require('lspconfig.server_configurations.bashls')
065.531  000.202  000.202: require('vim.treesitter.language')
065.542  000.628  000.425: require('vim.treesitter.query')
065.752  000.208  000.208: require('vim.treesitter._range')
065.759  001.327  000.491: require('vim.treesitter.languagetree')
065.771  001.679  000.353: require('vim.treesitter')
065.774  001.792  000.112: require('nvim-treesitter.compat')
067.808  001.549  001.549: require('nvim-treesitter.parsers')
068.036  000.224  000.224: require('nvim-treesitter.utils')
068.048  002.097  000.323: require('nvim-treesitter.ts_utils')
068.058  002.282  000.186: require('nvim-treesitter.tsrange')
068.193  000.133  000.133: require('nvim-treesitter.caching')
068.222  004.526  000.319: require('nvim-treesitter.query')
068.244  004.921  000.395: require('nvim-treesitter.configs')
068.678  000.181  000.181: require('treesitter-context.config')
068.699  000.445  000.264: require('treesitter-context')
070.394  000.130  000.130: require('cmp.utils.debug')
070.849  000.228  000.228: require('cmp.utils.char')
070.857  000.460  000.232: require('cmp.utils.str')
071.644  000.255  000.255: require('cmp.utils.misc')
071.762  000.107  000.107: require('cmp.utils.buffer')
071.902  000.138  000.138: require('cmp.utils.api')
071.911  000.873  000.372: require('cmp.utils.keymap')
071.913  001.055  000.182: require('cmp.utils.feedkeys')
072.837  000.102  000.102: require('cmp.types.cmp')
073.052  000.211  000.211: require('cmp.types.lsp')
073.134  000.079  000.079: require('cmp.types.vim')
073.135  000.505  000.112: require('cmp.types')
073.144  000.715  000.210: require('cmp.config.mapping')
073.262  000.116  000.116: require('cmp.utils.cache')
073.684  000.265  000.265: require('cmp.config.compare')
073.687  000.421  000.156: require('cmp.config.default')
073.716  001.515  000.264: require('cmp.config')
073.732  001.817  000.302: require('cmp.utils.async')
073.983  000.097  000.097: require('cmp.utils.pattern')
073.988  000.255  000.158: require('cmp.context')
075.396  000.588  000.588: require('cmp.utils.snippet')
075.713  000.314  000.314: require('cmp.matcher')
075.720  001.381  000.479: require('cmp.entry')
075.729  001.740  000.359: require('cmp.source')
076.238  000.115  000.115: require('cmp.utils.event')
076.957  000.098  000.098: require('cmp.utils.options')
076.964  000.486  000.387: require('cmp.utils.window')
076.966  000.725  000.239: require('cmp.view.docs_view')
077.886  000.135  000.135: require('cmp.utils.autocmd')
077.896  000.929  000.794: require('cmp.view.custom_entries_view')
078.266  000.369  000.369: require('cmp.view.wildmenu_entries_view')
078.439  000.170  000.170: require('cmp.view.native_entries_view')
078.598  000.157  000.157: require('cmp.view.ghost_text_view')
078.606  002.877  000.412: require('cmp.view')
078.967  009.301  000.969: require('cmp.core')
079.175  000.093  000.093: require('cmp.config.sources')
079.276  000.099  000.099: require('cmp.config.window')
079.316  010.510  001.017: require('cmp')
079.964  000.005  000.005: require('vim.keymap')
080.185  063.300  006.727: sourcing /home/mashu/.config/nvim/init.lua
080.197  014.819: sourcing vimrc file(s)
089.926  005.706  005.706: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/filetype.lua
092.325  000.078  000.078: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/syntax/synload.vim
092.435  002.356  002.278: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/syntax/syntax.vim
103.660  000.187  000.187: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/gzip.vim
103.705  000.011  000.011: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/health.vim
104.801  000.217  000.217: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/pack/dist/opt/matchit/plugin/matchit.vim
105.034  001.278  001.062: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/matchit.vim
105.218  000.156  000.156: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/matchparen.vim
105.600  000.350  000.350: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/netrwPlugin.vim
105.787  000.008  000.008: sourcing /nix/store/3yg4x4q6smfd87i6nplpbsz8yh02ndpj-neovim-0.9.5/rplugin.vim
105.923  000.270  000.262: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/rplugin.vim
106.032  000.065  000.065: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/shada.vim
106.095  000.023  000.023: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/spellfile.vim
106.259  000.122  000.122: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tarPlugin.vim
106.389  000.082  000.082: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tohtml.vim
106.446  000.017  000.017: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tutor.vim
106.638  000.152  000.152: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/zipPlugin.vim
107.295  000.093  000.093: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/editorconfig.lua
107.416  000.087  000.087: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/man.lua
107.502  000.048  000.048: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/nvim.lua
107.532  016.332: loading rtp plugins
116.495  000.030  000.030: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/luasnip/plugin/luasnip.vim
117.994  001.257  001.257: require('vim.filetype')
118.414  001.789  000.532: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/luasnip/plugin/luasnip.lua
138.383  019.674  019.674: require('cmp.utils.highlight')
138.723  020.117  000.443: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-cmp/plugin/cmp.lua
139.037  000.163  000.163: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-lspconfig/plugin/lspconfig.lua
140.066  000.196  000.196: require('nvim-treesitter.info')
140.319  000.250  000.250: require('nvim-treesitter.shell_command_selectors')
140.340  000.991  000.544: require('nvim-treesitter.install')
140.467  000.124  000.124: require('nvim-treesitter.statusline')
140.669  000.201  000.201: require('nvim-treesitter.query_predicates')
140.672  001.465  000.150: require('nvim-treesitter')
140.919  001.746  000.281: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-treesitter/plugin/nvim-treesitter.lua
141.110  000.043  000.043: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-treesitter-context/plugin/treesitter-context.lua
141.236  000.036  000.036: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/plenary.nvim/plugin/plenary.vim
141.840  000.350  000.350: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/telescope.nvim/plugin/telescope.lua
142.202  000.216  000.216: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/vim-surround/plugin/surround.vim
153.661  021.638: loading packages
154.716  000.077  000.077: require('cmp_buffer.timer')
154.723  000.322  000.245: require('cmp_buffer.buffer')
154.728  000.473  000.151: require('cmp_buffer.source')
154.732  000.548  000.075: require('cmp_buffer')
154.775  000.620  000.073: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-buffer/after/plugin/cmp_buffer.lua
154.949  000.052  000.052: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua
155.240  000.147  000.147: require('cmp_nvim_lua')
155.281  000.208  000.061: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua
155.687  000.261  000.261: require('cmp_path')
155.718  000.313  000.052: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-path/after/plugin/cmp_path.lua
156.093  000.216  000.216: require('cmp_luasnip')
156.146  000.304  000.088: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp_luasnip/after/plugin/cmp_luasnip.lua
156.172  001.013: loading after plugins
156.190  000.018: inits 3
158.610  002.420: reading ShaDa
159.447  000.218  000.218: require('luasnip.util.directed_graph')
159.568  000.117  000.117: require('luasnip.session.enqueueable_operations')
159.574  000.693  000.358: require('luasnip.loaders.from_lua')
161.481  000.109  000.109: require('luasnip.util.events')
161.499  000.507  000.398: require('luasnip.nodes.node')
161.947  000.446  000.446: require('luasnip.nodes.insertNode')
162.122  000.163  000.163: require('luasnip.nodes.textNode')
162.353  000.228  000.228: require('luasnip.util.mark')
162.522  000.165  000.165: require('luasnip.util.pattern_tokenizer')
162.654  000.128  000.128: require('luasnip.util.dict')
165.312  002.480  002.480: require('luasnip.util.jsregexp')
165.317  002.660  000.180: require('luasnip.nodes.util.trig_engines')
165.400  005.237  000.939: require('luasnip.nodes.snippet')
165.407  005.373  000.136: require('luasnip.nodes.duplicate')
165.408  005.494  000.121: require('luasnip.loaders.snippet_cache')
165.420  005.843  000.349: require('luasnip.loaders.from_snipmate')
166.874  000.192  000.192: require('luasnip.util.parser.neovim_ast')
167.057  000.179  000.179: require('luasnip.util.str')
167.779  000.716  000.716: require('luasnip.util.jsregexp')
167.788  001.425  000.338: require('luasnip.util.parser.ast_utils')
168.006  000.216  000.216: require('luasnip.nodes.functionNode')
168.377  000.368  000.368: require('luasnip.nodes.choiceNode')
168.726  000.346  000.346: require('luasnip.nodes.dynamicNode')
168.867  000.138  000.138: require('luasnip.util.functions')
168.875  002.797  000.305: require('luasnip.util.parser.ast_parser')
169.192  000.316  000.316: require('luasnip.util.parser.neovim_parser')
169.198  003.302  000.189: require('luasnip.util.parser')
169.330  000.130  000.130: require('luasnip.nodes.snippetProxy')
169.731  000.389  000.389: require('luasnip.util.jsonc')
169.742  004.317  000.496: require('luasnip.loaders.from_vscode')
169.761  000.300: opening buffers
169.804  000.042: BufEnter autocommands
169.806  000.002: editing files in windows
169.848  000.042: VimEnter autocommands
169.995  000.147: UIEnter autocommands
172.483  000.242  000.242: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/autoload/provider/clipboard.vim
172.490  002.253: before starting main loop
172.942  000.452: first screen update
172.944  000.002: --- NVIM STARTED ---


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.015  000.015: --- NVIM STARTING ---
000.178  000.163: event init
000.279  000.100: early init
000.361  000.082: locale set
000.414  000.053: init first window
000.737  000.323: inits 1
000.746  000.008: window checked
000.749  000.003: parsing arguments
001.171  000.055  000.055: require('vim.shared')
001.280  000.045  000.045: require('vim._options')
001.281  000.107  000.062: require('vim._editor')
001.283  000.205  000.043: require('vim._init_packages')
001.284  000.331: init lua interpreter
002.144  000.860: expanding arguments
002.203  000.059: inits 2
002.424  000.220: init highlight


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.012  000.012: --- NVIM STARTING ---
000.140  000.129: event init
000.204  000.064: early init
000.262  000.059: locale set
000.292  000.030: init first window
000.527  000.235: inits 1
000.539  000.012: window checked
000.541  000.002: parsing arguments
000.890  000.056  000.056: require('vim.shared')
000.994  000.035  000.035: require('vim._options')
000.996  000.102  000.067: require('vim._editor')
000.997  000.178  000.020: require('vim._init_packages')
000.998  000.280: init lua interpreter
001.083  000.085: expanding arguments
001.119  000.036: inits 2
001.321  000.203: init highlight
001.322  000.001: waiting for UI
001.388  000.066: done waiting for UI
001.399  000.011: clear screen
001.510  000.111: init default mappings & autocommands
001.597  000.087: --cmd commands
013.869  000.050  000.050: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/ftplugin.vim
015.833  000.027  000.027: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/indent.vim
016.723  000.162  000.162: require('poimandres.utils')
016.727  000.418  000.255: require('poimandres')
016.851  000.047  000.047: require('vim.loader')
020.013  000.690  000.690: require('poimandres.theme')
020.152  000.135  000.135: require('poimandres.palette')
021.582  002.287  001.462: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/poimandres.nvim/colors/poimandres.lua
021.981  000.173  000.173: require('telescope._extensions')
021.984  000.385  000.212: require('telescope')
024.498  000.320  000.320: require('plenary.bit')
024.656  000.155  000.155: require('plenary.functional')
024.676  000.013  000.013: require('ffi')
024.692  001.207  000.720: require('plenary.path')
024.703  001.435  000.227: require('plenary.strings')
024.845  000.141  000.141: require('telescope.deprecated')
025.611  000.004  000.004: require('vim.F')
025.634  000.262  000.258: require('plenary.log')
025.650  000.414  000.152: require('telescope.log')
026.456  000.368  000.368: require('plenary.job')
026.616  000.158  000.158: require('telescope.state')
026.625  000.974  000.448: require('telescope.utils')
026.629  001.783  000.395: require('telescope.sorters')
026.710  000.072  000.072: require('vim.inspect')
027.828  004.960  001.529: require('telescope.config')
028.461  000.268  000.268: require('plenary.window.border')
028.594  000.130  000.130: require('plenary.window')
028.713  000.117  000.117: require('plenary.popup.utils')
028.717  000.885  000.370: require('plenary.popup')
028.913  000.195  000.195: require('telescope.pickers.scroller')
029.078  000.163  000.163: require('telescope.actions.state')
029.283  000.203  000.203: require('telescope.actions.utils')
029.852  000.246  000.246: require('telescope.actions.mt')
029.881  000.596  000.350: require('telescope.actions.set')
030.374  000.250  000.250: require('telescope.config.resolve')
030.377  000.495  000.245: require('telescope.pickers.entry_display')
030.549  000.170  000.170: require('telescope.from_entry')
030.981  008.995  001.328: require('telescope.actions')
032.890  000.274  000.274: require('telescope._extensions.file_browser.utils')
034.229  001.335  001.335: require('plenary.scandir')
034.935  000.121  000.121: require('plenary.tbl')
034.939  000.268  000.148: require('plenary.vararg.rotate')
034.941  000.387  000.119: require('plenary.vararg')
035.059  000.117  000.117: require('plenary.errors')
035.062  000.681  000.177: require('plenary.async.async')
035.717  000.155  000.155: require('plenary.async.structs')
035.725  000.369  000.214: require('plenary.async.control')
035.743  000.560  000.191: require('plenary.async.util')
035.745  000.681  000.122: require('plenary.async.tests')
035.747  001.514  000.152: require('plenary.async')
035.786  003.777  000.654: require('telescope._extensions.file_browser.actions')
036.564  000.204  000.204: require('telescope._extensions.file_browser.git')
036.734  000.143  000.143: require('telescope._extensions.file_browser.make_entry_utils')
036.926  000.190  000.190: require('telescope._extensions.file_browser.fs_stat')
036.932  000.845  000.308: require('telescope._extensions.file_browser.make_entry')
037.512  000.132  000.132: require('plenary.class')
037.533  000.419  000.287: require('telescope._')
038.395  000.860  000.860: require('telescope.make_entry')
038.399  001.466  000.187: require('telescope.finders.async_oneshot_finder')
038.921  000.214  000.214: require('telescope.finders.async_static_finder')
039.146  000.222  000.222: require('telescope.finders.async_job_finder')
039.151  000.750  000.315: require('telescope.finders')
039.257  003.470  000.408: require('telescope._extensions.file_browser.finders')
041.229  000.254  000.254: require('telescope.debounce')
041.595  000.363  000.363: require('telescope.mappings')
041.841  000.243  000.243: require('telescope.pickers.highlights')
042.006  000.163  000.163: require('telescope.pickers.window')
042.189  000.182  000.182: require('telescope.pickers.layout')
042.681  000.245  000.245: require('telescope.algos.linked_list')
042.687  000.496  000.250: require('telescope.entry_manager')
042.857  000.168  000.168: require('telescope.pickers.multi')
042.877  003.376  001.508: require('telescope.pickers')
042.879  003.619  000.243: require('telescope._extensions.file_browser.picker')
043.126  000.246  000.246: require('telescope._extensions.file_browser.config')
043.130  011.291  000.179: require('telescope._extensions.file_browser')
044.697  000.086  000.086: require('luasnip.util.types')
044.780  000.079  000.079: require('luasnip.util.lazy_table')
044.895  000.114  000.114: require('luasnip.extras.filetype_functions')
044.915  000.546  000.267: require('luasnip.default_config')
044.917  000.647  000.101: require('luasnip.session')
044.927  001.006  000.359: require('luasnip.util.util')
045.543  000.180  000.180: require('luasnip.util.ext_opts')
045.631  000.086  000.086: require('luasnip.nodes.key_indexer')
045.648  000.720  000.455: require('luasnip.nodes.util')
046.115  000.108  000.108: require('luasnip.session.snippet_collection.source')
046.223  000.105  000.105: require('luasnip.util.table')
046.365  000.140  000.140: require('luasnip.util.auto_table')
046.410  000.761  000.407: require('luasnip.session.snippet_collection')
046.931  000.135  000.135: require('luasnip.util.select')
047.010  000.077  000.077: require('luasnip.util.time')
047.264  000.653  000.440: require('luasnip.util._builtin_vars')
047.300  000.889  000.236: require('luasnip.util.environ')
047.403  000.102  000.102: require('luasnip.util.extend_decorator')
047.762  000.189  000.189: require('luasnip.util.path')
048.103  000.149  000.149: require('luasnip.util.log')
048.108  000.344  000.195: require('luasnip.loaders.util')
048.190  000.081  000.081: require('luasnip.loaders.data')
048.490  000.298  000.298: require('luasnip.loaders.fs_watchers')
048.493  001.088  000.176: require('luasnip.loaders')
048.643  000.138  000.138: require('luasnip.config')
048.645  005.290  000.586: require('luasnip')
051.051  001.636  001.636: require('vim.lsp.log')
051.057  001.852  000.216: require('lsp-format')
053.073  000.510  000.510: require('vim.lsp.protocol')
054.498  000.382  000.382: require('vim.lsp._snippet')
054.709  000.208  000.208: require('vim.highlight')
054.725  001.648  001.058: require('vim.lsp.util')
054.743  002.635  000.478: require('vim.lsp.handlers')
055.234  000.489  000.489: require('vim.lsp.rpc')
055.508  000.271  000.271: require('vim.lsp.sync')
055.965  000.455  000.455: require('vim.lsp.semantic_tokens')
056.468  000.500  000.500: require('vim.lsp.buf')
056.744  000.273  000.273: require('vim.lsp.diagnostic')
057.044  000.298  000.298: require('vim.lsp.codelens')
057.110  006.038  001.116: require('vim.lsp')
057.407  000.103  000.103: require('cmp_nvim_lsp.source')
057.410  000.221  000.118: require('cmp_nvim_lsp')
058.240  000.321  000.321: require('lspconfig.util')
058.371  000.128  000.128: require('lspconfig.async')
058.395  000.729  000.281: require('lspconfig.configs')
058.397  000.855  000.125: require('lspconfig')
058.507  000.108  000.108: require('lspconfig.server_configurations.nixd')
059.425  000.258  000.258: require('lspconfig.manager')
059.557  000.126  000.126: require('lspconfig.server_configurations.bashls')
063.182  000.231  000.231: require('vim.treesitter.language')
063.207  000.769  000.537: require('vim.treesitter.query')
063.432  000.223  000.223: require('vim.treesitter._range')
063.446  001.577  000.586: require('vim.treesitter.languagetree')
063.460  002.011  000.434: require('vim.treesitter')
063.465  002.147  000.136: require('nvim-treesitter.compat')
066.251  002.195  002.195: require('nvim-treesitter.parsers')
066.540  000.286  000.286: require('nvim-treesitter.utils')
066.557  002.861  000.381: require('nvim-treesitter.ts_utils')
066.573  003.107  000.246: require('nvim-treesitter.tsrange')
066.724  000.150  000.150: require('nvim-treesitter.caching')
066.746  005.913  000.510: require('nvim-treesitter.query')
066.772  006.569  000.655: require('nvim-treesitter.configs')
067.297  000.192  000.192: require('treesitter-context.config')
067.316  000.529  000.337: require('treesitter-context')
068.469  000.089  000.089: require('cmp.utils.debug')
068.762  000.135  000.135: require('cmp.utils.char')
068.767  000.296  000.161: require('cmp.utils.str')
069.258  000.175  000.175: require('cmp.utils.misc')
069.352  000.091  000.091: require('cmp.utils.buffer')
069.474  000.120  000.120: require('cmp.utils.api')
069.478  000.599  000.213: require('cmp.utils.keymap')
069.480  000.711  000.112: require('cmp.utils.feedkeys')
070.216  000.090  000.090: require('cmp.types.cmp')
070.427  000.209  000.209: require('cmp.types.lsp')
070.552  000.121  000.121: require('cmp.types.vim')
070.555  000.512  000.093: require('cmp.types')
070.561  000.681  000.169: require('cmp.config.mapping')
070.704  000.140  000.140: require('cmp.utils.cache')
071.107  000.240  000.240: require('cmp.config.compare')
071.110  000.403  000.163: require('cmp.config.default')
071.126  001.425  000.202: require('cmp.config')
071.137  001.656  000.231: require('cmp.utils.async')
071.386  000.101  000.101: require('cmp.utils.pattern')
071.390  000.251  000.151: require('cmp.context')
072.362  000.292  000.292: require('cmp.utils.snippet')
072.586  000.222  000.222: require('cmp.matcher')
072.592  000.901  000.387: require('cmp.entry')
072.597  001.206  000.305: require('cmp.source')
072.899  000.095  000.095: require('cmp.utils.event')
073.360  000.085  000.085: require('cmp.utils.options')
073.364  000.309  000.225: require('cmp.utils.window')
073.366  000.465  000.156: require('cmp.view.docs_view')
073.822  000.109  000.109: require('cmp.utils.autocmd')
073.829  000.462  000.352: require('cmp.view.custom_entries_view')
074.054  000.223  000.223: require('cmp.view.wildmenu_entries_view')
074.226  000.170  000.170: require('cmp.view.native_entries_view')
074.385  000.158  000.158: require('cmp.view.ghost_text_view')
074.393  001.795  000.222: require('cmp.view')
074.615  006.631  000.627: require('cmp.core')
074.836  000.095  000.095: require('cmp.config.sources')
074.926  000.087  000.087: require('cmp.config.window')
074.964  007.524  000.711: require('cmp')
075.570  000.005  000.005: require('vim.keymap')
075.777  059.750  006.954: sourcing /home/mashu/.config/nvim/init.lua
075.789  014.365: sourcing vimrc file(s)
086.165  006.435  006.435: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/filetype.lua
088.503  000.077  000.077: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/syntax/synload.vim
088.622  002.315  002.238: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/syntax/syntax.vim
098.655  000.120  000.120: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/gzip.vim
098.685  000.006  000.006: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/health.vim
099.419  000.125  000.125: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/pack/dist/opt/matchit/plugin/matchit.vim
099.594  000.868  000.743: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/matchit.vim
099.713  000.098  000.098: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/matchparen.vim
099.968  000.235  000.235: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/netrwPlugin.vim
100.108  000.007  000.007: sourcing /nix/store/3yg4x4q6smfd87i6nplpbsz8yh02ndpj-neovim-0.9.5/rplugin.vim
100.194  000.190  000.183: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/rplugin.vim
100.264  000.042  000.042: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/shada.vim
100.307  000.014  000.014: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/spellfile.vim
100.400  000.070  000.070: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tarPlugin.vim
100.486  000.054  000.054: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tohtml.vim
100.534  000.020  000.020: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/tutor.vim
100.665  000.106  000.106: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/zipPlugin.vim
101.149  000.060  000.060: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/editorconfig.lua
101.237  000.058  000.058: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/man.lua
101.298  000.038  000.038: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/plugin/nvim.lua
101.316  014.798: loading rtp plugins
108.370  000.022  000.022: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/luasnip/plugin/luasnip.vim
109.388  000.829  000.829: require('vim.filetype')
109.675  001.207  000.378: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/luasnip/plugin/luasnip.lua
128.804  018.902  018.902: require('cmp.utils.highlight')
129.159  019.336  000.434: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-cmp/plugin/cmp.lua
129.480  000.170  000.170: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-lspconfig/plugin/lspconfig.lua
130.550  000.212  000.212: require('nvim-treesitter.info')
130.807  000.253  000.253: require('nvim-treesitter.shell_command_selectors')
130.831  001.033  000.568: require('nvim-treesitter.install')
130.959  000.126  000.126: require('nvim-treesitter.statusline')
131.176  000.216  000.216: require('nvim-treesitter.query_predicates')
131.179  001.514  000.138: require('nvim-treesitter')
131.513  001.884  000.370: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-treesitter/plugin/nvim-treesitter.lua
131.714  000.045  000.045: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/nvim-treesitter-context/plugin/treesitter-context.lua
131.830  000.024  000.024: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/plenary.nvim/plugin/plenary.vim
132.350  000.278  000.278: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/telescope.nvim/plugin/telescope.lua
132.759  000.278  000.278: sourcing /nix/store/zw0hcwgczicvlx891hypavayz8vgxjqg-packdir-start/pack/myNeovimPackages/start/vim-surround/plugin/surround.vim
142.644  018.084: loading packages
143.480  000.053  000.053: require('cmp_buffer.timer')
143.485  000.251  000.198: require('cmp_buffer.buffer')
143.488  000.381  000.130: require('cmp_buffer.source')
143.490  000.430  000.050: require('cmp_buffer')
143.542  000.516  000.085: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-buffer/after/plugin/cmp_buffer.lua
143.690  000.043  000.043: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua
143.917  000.121  000.121: require('cmp_nvim_lua')
143.949  000.167  000.047: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua
144.315  000.243  000.243: require('cmp_path')
144.405  000.349  000.106: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp-path/after/plugin/cmp_path.lua
144.776  000.219  000.219: require('cmp_luasnip')
144.869  000.362  000.143: sourcing /nix/store/ibwa01pjvzsdidd30fwf8vcs60lw6kf8-vim-pack-dir/pack/myNeovimPackages/start/cmp_luasnip/after/plugin/cmp_luasnip.lua
144.899  000.817: loading after plugins
144.919  000.020: inits 3
147.293  002.374: reading ShaDa
148.077  000.189  000.189: require('luasnip.util.directed_graph')
148.171  000.091  000.091: require('luasnip.session.enqueueable_operations')
148.176  000.594  000.314: require('luasnip.loaders.from_lua')
149.717  000.085  000.085: require('luasnip.util.events')
149.727  000.400  000.316: require('luasnip.nodes.node')
150.003  000.275  000.275: require('luasnip.nodes.insertNode')
150.127  000.121  000.121: require('luasnip.nodes.textNode')
150.295  000.166  000.166: require('luasnip.util.mark')
150.437  000.140  000.140: require('luasnip.util.pattern_tokenizer')
150.542  000.103  000.103: require('luasnip.util.dict')
152.630  001.944  001.944: require('luasnip.util.jsregexp')
152.634  002.089  000.145: require('luasnip.nodes.util.trig_engines')
152.663  003.997  000.703: require('luasnip.nodes.snippet')
152.665  004.097  000.101: require('luasnip.nodes.duplicate')
152.667  004.207  000.110: require('luasnip.loaders.snippet_cache')
152.675  004.495  000.288: require('luasnip.loaders.from_snipmate')
153.748  000.144  000.144: require('luasnip.util.parser.neovim_ast')
153.885  000.134  000.134: require('luasnip.util.str')
154.406  000.516  000.516: require('luasnip.util.jsregexp')
154.410  001.040  000.245: require('luasnip.util.parser.ast_utils')
154.581  000.169  000.169: require('luasnip.nodes.functionNode')
154.888  000.305  000.305: require('luasnip.nodes.choiceNode')
155.196  000.304  000.304: require('luasnip.nodes.dynamicNode')
155.327  000.128  000.128: require('luasnip.util.functions')
155.334  002.179  000.234: require('luasnip.util.parser.ast_parser')
155.654  000.318  000.318: require('luasnip.util.parser.neovim_parser')
155.659  002.641  000.144: require('luasnip.util.parser')
155.785  000.124  000.124: require('luasnip.nodes.snippetProxy')
156.130  000.342  000.342: require('luasnip.util.jsonc')
156.140  003.462  000.356: require('luasnip.loaders.from_vscode')
156.152  000.308: opening buffers
156.187  000.034: BufEnter autocommands
156.189  000.002: editing files in windows
156.225  000.036: VimEnter autocommands
156.350  000.125: UIEnter autocommands
158.692  000.241  000.241: sourcing /nix/store/aszfdv0palw8vgpswijvgn273fip4306-neovim-unwrapped-0.9.5/share/nvim/runtime/autoload/provider/clipboard.vim
158.699  002.109: before starting main loop
158.889  000.190: first screen update
158.891  000.002: --- NVIM STARTED ---
