return {
  "3rd/image.nvim",
  enabled = true,
  opts = {
    backend = "kitty",
    processor = "magick_cli", -- or "magick_rock"
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        only_render_image_at_cursor_mode = "popup", -- or "inline"
        floating_windows = false, -- if true, images will be rendered in floating markdown windows
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        filetypes = { "norg" },
      },
      typst = {
        enabled = true,
        filetypes = { "typst" },
      },
      html = {
        enabled = false,
      },
      css = {
        enabled = false,
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    scale_factor = 1.0,
    window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
    editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
    tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  },
  config = function(_, opts)
    require("image").setup(opts)

    -- Helper function to resize norg images
    local function resize_norg_image()
      local line = vim.api.nvim_get_current_line()
      local row = vim.api.nvim_win_get_cursor(0)[1]

      -- Match .image syntax with or without existing dimensions
      local path, dimensions = line:match("^%s*%.image%s+(.-)%s*{?([%dx]*)}?%s*$")

      if not path then
        -- Try without dimensions
        path = line:match("^%s*%.image%s+(.-)%s*$")
      end

      if path then
        -- Prompt for new dimensions
        vim.ui.input({
          prompt = "Enter width (e.g., 400) or width×height (e.g., 400x300): ",
          default = dimensions or "",
        }, function(input)
          if input and input ~= "" then
            local new_line = string.format(".image %s {%s}", path, input)
            vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
            -- Trigger image refresh
            vim.cmd("edit")
          end
        end)
      else
        vim.notify("Not on a valid .image line", vim.log.levels.WARN)
      end
    end

    -- Set up keybinding for norg files only
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "norg",
      callback = function()
        vim.keymap.set("n", "<leader>ir", resize_norg_image, {
          buffer = true,
          desc = "Resize norg image at cursor"
        })
      end,
    })
  end,
}
