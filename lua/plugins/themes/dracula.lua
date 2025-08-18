return {
  "Mofiqul/dracula.nvim", config = function()
      require("dracula").setup({
        colors = {},
        show_end_of_buffer = true, -- default false
        transparent_bg = true, -- default false
        lualine_bg_color = "#44475a", -- default nil
        italic_comment = true, -- default false,
        overrides = function(colors)
          return {
            -- Basic diff highlights
            DiffAdd = { bg = '#34462F' },
            DiffDelete = { bg = '#462F2F' },
            DiffChange = { bg = '#2F4146' },
            DiffText = { bg = '#463C2F' },
            
            -- Diffview specific highlights
            DiffAdded = { fg = colors.green, bold = true },
            DiffRemoved = { fg = colors.red, bold = true },
            DiffChanged = { fg = colors.orange, bold = true },
            
            DiffviewWinSeparator = { fg = colors.comment },
            DiffviewDiffDelete = { fg = colors.comment },
            DiffviewFilePanelSelected = { fg = colors.cyan },
            
            DiffviewStatusAdded = { fg = colors.green, bold = true },
            DiffviewStatusUntracked = { fg = colors.yellow, bold = true },
            DiffviewStatusModified = { fg = colors.orange, bold = true },
            DiffviewStatusRenamed = { fg = colors.green, bold = true },
            DiffviewStatusDeleted = { fg = colors.red, bold = true },
            DiffviewStatusIgnored = { fg = colors.comment, bold = true },
          }
        end,
      })
      -- Dracula color palette for markdown
      local dracula_bg = "#282a36"
      local dracula_purple = "#bd93f9"
      local dracula_pink = "#ff79c6"
      local dracula_cyan = "#8be9fd"
      local dracula_green = "#50fa7b"
      local dracula_orange = "#ffb86c"
      local dracula_red = "#ff5555"
      local dracula_yellow = "#f1fa8c"
      --
      -- Diff highlights with Dracula colors
      -- vim.api.nvim_set_hl(0, "DiffAdd", {
      --   fg = dracula_green,
      --   bg = "#2a4332",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "DiffChange", {
      --   fg = dracula_orange,
      --   bg = "#3a3420",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "DiffDelete", {
      --   fg = dracula_red,
      --   bg = "#402424",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "DiffText", {
      --   fg = dracula_purple,
      --   bg = "#3c2e5a",
      --   bold = true,
      -- })
      --
      -- -- Editor background
      -- vim.api.nvim_set_hl(0, "Normal", { bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = dracula_bg })
      --
      -- -- Gutter styling
      -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272a4", bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = dracula_yellow, bg = dracula_bg, bold = true })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "FoldColumn", { bg = dracula_bg })
      --
      -- -- Git gutter with Dracula colors
      -- vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = dracula_green, bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "GitGutterChange", { fg = dracula_orange, bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = dracula_red, bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = dracula_green, bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = dracula_orange, bg = dracula_bg })
      -- vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = dracula_red, bg = dracula_bg })
      --
      -- -- Neogit diff views with Dracula theme
      -- vim.api.nvim_set_hl(0, "NeogitDiffAdd", {
      --   fg = dracula_green,
      --   bg = "#2a4332",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "NeogitDiffDelete", {
      --   fg = dracula_red,
      --   bg = "#402424",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", {
      --   bg = "#363650",
      -- })
      -- vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", {
      --   fg = dracula_green,
      --   bg = "#2a4332",
      --   bold = false,
      -- })
      -- vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", {
      --   fg = dracula_red,
      --   bg = "#402424",
      --   bold = false,
      -- })
      --
    --
      -- -- RenderMarkdown highlight groups for Dracula theme
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = dracula_purple })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = dracula_pink })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = dracula_cyan })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = dracula_green })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = dracula_orange })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = dracula_red })
      --
      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#3c2e5a" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#4a2b48" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#2b4a4a" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#2a4332" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#4a3628" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#4a2828" })

      -- Code block highlighting
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#1e1f29" })
      vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = "#1e1f29", fg = dracula_cyan })

      vim.cmd.colorscheme("dracula-soft")
      -- Make cursor line more transparent for better comment readability
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#44475a", blend = 99 })
      
      -- Comment visibility options (uncomment one):
      -- Option 1: Faded yellow
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#b8a965", italic = true })
      
      -- Option 2: Faded blue  
      vim.api.nvim_set_hl(0, "Comment", { fg = "#8fa1c9", italic = true })
      
      -- Option 3: Slightly more visible grey
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#7d8390", italic = true })
      
      -- Option 4: Warmer grey with slight yellow tint
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#8a8576", italic = true })
      
      -- Option 5: Faded purple
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#a48cc7", italic = true })
      
      -- Option 6: Faded indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#7f85b8", italic = true })
      
      -- Option 7: Darker indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#6b7196", italic = true })
      
      -- Option 8: Lighter indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#9199d4", italic = true })
      
      -- Option 9: Purple-indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#8a7cb8", italic = true })
      
      -- Option 10: Deeper purple-indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#7a6ba8", italic = true })
      
      -- Option 11: Softer purple-indigo
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#9a8dc8", italic = true })
      
      -- Noice.nvim command line popup styling (: input box)
      -- Using DiagnosticInfo highlight group that noice references
      vim.api.nvim_set_hl(0, "DiagnosticInfo", { 
        fg = dracula_cyan,  -- Cyan text for the border
        bg = dracula_bg     -- Dark background
      })
      
      -- Additional command line styling for better Dracula integration
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { 
        bg = dracula_bg,    -- Dark background for popup
        fg = dracula_purple -- Purple text
      })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { 
        fg = dracula_purple, -- Purple border
        bg = dracula_bg
      })
      -- 
    end,
}
