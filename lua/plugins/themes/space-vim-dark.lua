return {
	{
		"liuchengxu/space-vim-dark",
		enabled = false,
		-- priority = 1000,
		config = function()
			-- Set the colorscheme
			vim.cmd("colorscheme space-vim-dark")

			-- Refined contrast with slightly richer tones
			vim.api.nvim_set_hl(0, "DiffAdd", {
				fg = "#9ece6a",
				bg = "#2a3c2a",
				bold = false, -- deep olive green
			})
			vim.api.nvim_set_hl(0, "DiffChange", {
				fg = "#e0c46c",
				bg = "#3a341c",
				bold = false, -- warmer goldenrod
			})
			vim.api.nvim_set_hl(0, "DiffDelete", {
				fg = "#f44747",
				bg = "#402424",
				bold = false, -- punchier red
			})
			vim.api.nvim_set_hl(0, "DiffText", {
				fg = "#bb9af7",
				bg = "#3c2e5a",
				bold = true, -- vibrant lavender
			})

			-- Base editor background from space-vim-dark (customized to be darker)
      -- previously: local base_bg = "#1e2024"
			local base_bg = "#1e2024"

			-- Override the main background colors to be darker
			vim.api.nvim_set_hl(0, "Normal", { bg = base_bg })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = base_bg })

			-- Force gutter-related groups to use the same bg
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c5c5c", bg = base_bg })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d7ba7d", bg = base_bg, bold = true })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = base_bg })
			vim.api.nvim_set_hl(0, "FoldColumn", { bg = base_bg })
			vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#9ece6a", bg = base_bg })
			vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#e0c46c", bg = base_bg })
			vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#f44747", bg = base_bg })

			-- Match git-diffed line numbers to your normal LineNr color
			vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#6ece6a", bg = base_bg })
			vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#e0c46c", bg = base_bg })
			vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#f44747", bg = base_bg })

			-- Neogit diff views with styled theme
			vim.api.nvim_set_hl(0, "NeogitDiffAdd", {
				fg = "#9ece6a",
				bg = "#2a3c2a",
				bold = false,
			})
			vim.api.nvim_set_hl(0, "NeogitDiffDelete", {
				fg = "#f44747",
				bg = "#402424",
				bold = false,
			})
			vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", {
				bg = "#262626", -- Dim background for unchanged lines
			})
			vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", {
				fg = "#9ece6a",
				bg = "#2a3c2a",
				bold = false,
			})
			vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", {
				fg = "#f44747",
				bg = "#402424",
				bold = false,
			})

			-- Markdown heading colors to match spacemacs theme
			-- vim.api.nvim_set_hl(0, "markdownH1", { fg = "#bb9af7", bold = true }) -- vibrant lavender
			-- vim.api.nvim_set_hl(0, "markdownH2", { fg = "#7aa2f7", bold = true }) -- blue
			-- vim.api.nvim_set_hl(0, "markdownH3", { fg = "#7dcfff", bold = true }) -- cyan
			-- vim.api.nvim_set_hl(0, "markdownH4", { fg = "#9ece6a", bold = true }) -- green
			-- vim.api.nvim_set_hl(0, "markdownH5", { fg = "#20c46c", bold = true }) -- yellow/gold
			-- vim.api.nvim_set_hl(0, "markdownH6", { fg = "#f44747", bold = true }) -- red

			-- RenderMarkdown highlight groups for dark spacemacs theme
			vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#bb9af7" }) -- vibrant lavender
			vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#7aa2f7" }) -- blue
			vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#7dcfff" }) -- cyan
			vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#9ece6a" }) -- green
			vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#c678dd" }) -- purple (no more gold!)
			vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#f44747" }) -- red
			
			vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#2e2e3f" }) -- dark purple background
			vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#2a2a3e" }) -- dark blue background
			vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#253544" }) -- dark cyan background
			vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#2a3626" }) -- dark green background
			vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#3a2f26" }) -- dark brown background
			vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#3a2626" }) -- dark red background
		end,
	},
}
