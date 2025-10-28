let
  themeColors = {
    bg = "none";
    fg = "#ffffff";
    yellow = "#ECBE7B";
    cyan = "#008080";
    darkblue = "#081633";
    green = "#5de4c7";
    orange = "#FF8800";
    violet = "#a9a1e1";
    magenta = "#c678dd";
    blue = "#51afef";
    red = "#ec5f67";
  };
  colors = themeColors // {
    bg = "none";
    fg = "#ffffff";
  };
in
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        alwaysDivideMiddle = true;
        iconsEnabled = true;
        theme = {
          normal = with themeColors; {
            a = {
              fg = themeColors.bg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
          insert = {
            a = {
              fg = themeColors.fg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
          visual = {
            a = {
              fg = themeColors.bg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
          replace = {
            a = {
              fg = themeColors.bg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
          command = {
            a = {
              fg = themeColors.bg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
          inactive = {
            a = {
              fg = themeColors.fg;
              bg = themeColors.bg;
              gui = "bold";
            };
            b = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
            c = {
              fg = themeColors.fg;
              bg = themeColors.bg;
            };
          };
        };
      };
    };
  };

  programs.nixvim.extraConfigLua = ''

      local function diff_source()
      ---@diagnostic disable-next-line: undefined-field
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    local components = {}

    components.mode = {
      "mode",
      color = function()
        -- auto change color according to neovims mode{{{
        local mode_color = {
          n = "${colors.green}",
          i = "${colors.blue}",
          v = "${colors.magenta}",
          [""] = "${colors.magenta}",
          V = "${colors.magenta}",
          c = "${colors.red}",
          no = "${colors.red}",
          s = "${colors.orange}",
          S = "${colors.orange}",
          [""] = "${colors.orange}",
          ic = "${colors.yellow}",
          R = "${colors.violet}",
          Rv = "${colors.violet}",
          cv = "${colors.red}",
          ce = "${colors.red}",
          r = "${colors.cyan}",
          rm = "${colors.cyan}",
          ["r?"] = "${colors.cyan}",
          ["!"] = "${colors.red}",
          t = "${colors.red}",
        } -- }}}
        return { fg = mode_color[vim.fn.mode()], bg = "none" }
      end,
      fmt = function()
        return ""
      end,
    }


    components.branch = {
      "b:gitsigns_head",
      icon = "",
      color = { gui = "bold" },
    }
    components.diff = {
      "diff",
      source = diff_source,
      symbols = {
        added = "" .. " ",
        modified = "" .. " ",
        removed = "" .. " ",
      },
    }
    components.diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = "" .. " ",
        warn = "" .. " ",
        info = "" .. " ",
        hint = "" .. " ",
      },
    }
    components.filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
    components.fileformat = { "fileformat", cond = nil, padding = { left = 1, right = 1 }, color = "SLGreen" }
    components.filename = { "filename", color = "${colors.green}"}

    components.lsp = {
      function()
        local clients = vim.lsp.get_active_clients()
        local names = {}

        if next(clients) == nil then
          return "Ls Inactive"
        end
        for _, client in ipairs(clients) do
          if client.name ~= "copilot" and client.name ~= "null-ls" then
            table.insert(names, client.name)
          end
        end

        local nok, null_ls = pcall(require, "null-ls")
        if not nok then
          return "[" .. table.concat(vim.fn.uniq(names), ", ") .. "]"
        end

        -- if using null-ls (Depricated now)
        local buf_ft = vim.bo.filetype

        local function registered_method(filetype)
          local sources = require("null-ls.sources")
          local available_sources = sources.get_available(filetype)
          local registered = {}

          for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
              registered[method] = registered[method] or {}
              table.insert(registered[method], source.name)
            end
          end

          return registered or {}
        end

        local f = null_ls.methods.FORMATTING
        vim.list_extend(names, registered_method(buf_ft)[f])

        -- local d = null_ls.methods.DIAGNOSTICS
        local alternative_methods = {
          null_ls.methods.DIAGNOSTICS,
          null_ls.methods.DIAGNOSTICS_ON_OPEN,
          null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }

        local registered_providers = registered_method(buf_ft)
        local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
          return registered_providers[m] or {}
        end, alternative_methods))

        vim.list_extend(names, providers_for_methods)

        return "[" .. table.concat(vim.fn.uniq(names), ", ") .. "]"
      end,
    }

    components.indicator = function()
      local ok, noice = pcall(require, "noice")
      if not ok then
        return ""
      end
      return {
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      }
    end

    components.copilot = function()
      local lsp_clients = vim.lsp.get_active_clients()
      local copilot_active = false
      local str = ""
      if next(lsp_clients) == nil then
        return str
      end

      for _, client in ipairs(lsp_clients) do
        if client.name == "copilot" then
          copilot_active = true
          break
        end
      end
      if copilot_active then
        str = "%#SLGreen#" .. ""
      end
      return str
    end

    components.location = {
      "location",
      color = { fg = "#ffffff" },
    }

    local sections = {
      lualine_a = { components.mode },
      lualine_b = { "filename", "encoding" },
      lualine_c = { components.branch, components.diff },
      lualine_x = {
        components.indicator(),
        components.diagnostics,
        components.filetype,
        components.lsp,
      },
      lualine_y = { "progress" },
      lualine_z = { components.location, components.copilot },
    }
    local lualine = require("lualine")
    lualine.setup({
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "alpha",
          "dashboard",
          "NvimTree",
          "Outline",
          "neo-tree",
          "dashboard",
          "Alpha",
        },
      },
      sections = sections,
    })
  '';
}
