return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = true,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim', 'nvim-tree/nvim-web-devicons'},
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { 
      "markdown", 
      "Avante" 
    },
    render = {
      max_file_size = 5.0,
      debounce = 100,
    },
    anti_conceal = {
      enabled = true,
    },
    latex = {
      enabled = false,
    },
    win_options = {
      conceallevel = {
        rendered = 2,
      },
    },
    heading = {
      position = 'overlay',
      icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
      -- signs = { 'RenderMarkdownH1', 'RenderMarkdownH2', 'RenderMarkdownH3', 'RenderMarkdownH4', 'RenderMarkdownH5', 'RenderMarkdownH6' },
      backgrounds = { 'RenderMarkdownH1Bg', 'RenderMarkdownH2Bg', 'RenderMarkdownH3Bg', 'RenderMarkdownH4Bg', 'RenderMarkdownH5Bg', 'RenderMarkdownH6Bg' },
      foregrounds = { 'RenderMarkdownH1', 'RenderMarkdownH2', 'RenderMarkdownH3', 'RenderMarkdownH4', 'RenderMarkdownH5', 'RenderMarkdownH6' },
    },
    bullet = {
      icons = { '◉', '○', '✸', '✦' },
    },
    checkbox = {
      unchecked = { icon = '☐ ' },
      checked = { icon = '☑ ' },
    },
  },
  ft = { "markdown", "Avante" },
}
