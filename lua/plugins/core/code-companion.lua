return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"nvim-treesitter/nvim-treesitter", build = "TSUpdate"}
  },
  config = function()
    require("codecompanion").setup({
      opts = {
        log_level = "DEBUG"
      },
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = 'cmd:"op read op://dev/OpenAI/credential --no-newline"'
            },
            schema = {
              model = {
                default = "gpt-4.1",
              },
            },
          })
        end,
      },

      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        },
        cmd = {
          adapter = "openai",
        },
      } 
    })
  end,
}

