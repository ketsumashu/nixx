return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup_handlers({ function(server)
                local opt = {
                    -- Function executed when the LSP server startup
                    --on_attach = function(client, bufnr)
                    --local opts = { noremap = true, silent = true }
                    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                    -- vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format()'
                    --end,
                    capabilities = require('cmp_nvim_lsp').default_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    )
                }
                require('lspconfig')[server].setup(opt)
            end })

            vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
            vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
            vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
            vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
            vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
            -- LSP handlers
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
            )
            local signs = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " "
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end
    },
    {
        'williamboman/mason.nvim',

        event = "BufReadPre",
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = "BufReadPre",
    },
}
