return {
  "3rd/image.nvim",
  enabled = true,
  opts = {
    backend = "kitty", -- or wezterm / iTerm2
    integrations = {
      markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = false, 
      only_render_image_at_cursor = false
      }
    },
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" }
  }
}
