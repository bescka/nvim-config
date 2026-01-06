return {
  "nvim-neorg/neorg",
  enabled=true,
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neorg/lua-utils.nvim",
    "nvim-neotest/nvim-nio",
    "MunifTanjim/nui.nvim",
    "pysan3/pathlib.nvim",
    "3rd/image.nvim",
  },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        config = { -- We added a `config` table!
          icon_preset = "varied", -- And we set our option here.
          folding = false,
        },
      },
      ["core.integrations.image"] = {},
      ["core.integrations.treesitter"] = {},
      -- ["core.latex.renderer"] = {
      --   config = {
      --     conceal = true,
      --     render_on_enter = true,
      --     debounce_ms = 100,
      --     dpi = 150,
      --     renderer = "core.integrations.image",
      --     scale = 1
      --   }
      -- },
      ["core.integrations.nvim-cmp"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/notes",
          }
        }
      },
      ["core.autocommands"] = {},
      ["core.highlights"] = {},
      ["core.neorgcmd"] = {}

      }
    }
  }

