return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-nvim-lsp',
            },
        },
        config = function()
            local check_backspace = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
            end
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            vim.g.cmp_active = true
            cmp.setup({
                enabled = function()
                    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
                    if buftype == "prompt" then
                        return false
                    end
                    return vim.g.cmp_active
                end,
                preselect = cmp.PreselectMode.None,
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
                view = {
                    entries = "custom"
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-l>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm { select = false },
                }),
                experimental = {
                    ghost_text = false,
                },
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                view = {
                    entries = "custom"
                },
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                view = {
                    entries = "custom"
                }
            })
        end,
        event = { 'InsertEnter', 'CmdlineEnter' },
    },
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        config = function()
            require 'luasnip.loaders.from_vscode'.lazy_load()
        end,
    },
    {
        'vim-skk/skkeleton',
        dependencies = "vim-denops/denops.vim",
        config = function()
            vim.cmd [[
            call skkeleton#config({
            \  'eggLikeNewline': v:true,
            \  'globalDictionaries': ["/home/mashu/dotfiles/libskk/SKK-JISYO.L"],
            \  'markerHenkan': ">",
            \  'markerHenkanSelect': ">>",
            \  'sources': ["skk_dictionary","google_japanese_input"]
            \})
            call skkeleton#register_keymap('input', ';', 'henkanPoint')
            ]]
        end,
        event = 'VimEnter',
    },
    {
        'delphinus/skkeleton_indicator.nvim',
        config = function ()
            require 'skkeleton_indicator'.setup{
                hiraText = "hl",
                kataText = "kt",
                eijiText = "ej",
                hankataText = "hnk",
                zenkakuText = "zen",
            }
        end,
        event = 'VimEnter'
    }
}
