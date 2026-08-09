# Nixvim -> Lua conversion

This directory is a hand-cleaned Lua reconstruction based on the supplied Nixvim configuration and generated init.lua.

The Lua modules assume the referenced Neovim plugins are already installed. Nixvim previously handled plugin installation; this conversion intentionally separates plugin installation from plugin configuration.

Modules:

- `init.lua`: entry point
- `lua/options.lua`: editor options
- `lua/keymaps.lua`: general and plugin keymaps
- `lua/autocmds.lua`: autocommands
- `lua/colorscheme.lua`: Poimandres and devicons
- `lua/cmp.lua`: nvim-cmp and LuaSnip
- `lua/treesitter.lua`: Treesitter, context, autotag, textobjects
- `lua/lsp.lua`: bashls, cssls, lua_ls, nixd
- `lua/plugins/*.lua`: plugin-specific configuration

Nix-only concerns such as Nix store paths and Nixvim's generated wrapper tables are intentionally omitted.
