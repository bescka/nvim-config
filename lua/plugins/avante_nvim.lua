return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- for example
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
      },
      -- moonshot = {
      --   endpoint = "https://api.moonshot.ai/v1",
      --   model = "kimi-k2-0711-preview",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 32768,
      --   },
      -- },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}



-- return {
--   "yetone/avante.nvim",
--   enabled=false,
--   -- You can re-enable build if needed later
--   build = function()
--     if vim.fn.has("win32") == 1 then
--       return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
--     else
--       return "make"
--     end
--   end,
--   event = "VeryLazy",
--   version = false,
--   opts = {
--     provider = "openai",
--     providers = {
--       openai = {
--         endpoint = "https://api.openai.com/v1/chat/completions",
--         model = "gpt-4o",
--         timeout = 30000,
--         extra_request_body = {
--           temperature = 0.75,
--           max_tokens = 2048,
--         },
--       },
--     },
--   },
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "echasnovski/mini.pick",
--     "nvim-telescope/telescope.nvim",
--     "hrsh7th/nvim-cmp",
--     "ibhagwan/fzf-lua",
--     "stevearc/dressing.nvim",
--     "folke/snacks.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "zbirenbaum/copilot.lua",
--     {
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           use_absolute_path = true,
--         },
--       },
--     },
--     -- {
--     --   'MeanderingProgrammer/render-markdown.nvim',
--     --   opts = {
--     --     file_types = { "markdown" }, -- Removed "Avante" unless you define it elsewhere
--     --   },
--     --   ft = { "markdown" },
--     -- },
--   },
-- }
--
--
