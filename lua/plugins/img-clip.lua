return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      embed_image_as_base64 = false,
      prompt_for_file_name = false,
      drag_and_drop = {
        insert_mode = true,
      },
      use_absolute_path = false,
      -- Process images with ImageMagick: resize to max 1200px width and compress
      process_cmd = "convert - -resize '1200x>' -quality 85 -",
    },
    filetypes = {
      norg = {
        template = ".image $FILE_PATH",
      },
      markdown = {
        template = "![]($FILE_PATH)",
      },
    },
  },
  keys = {
    -- Paste image with Ctrl+V in insert mode (only when image is in clipboard)
    { "<C-v>", "<cmd>PasteImage<cr>", mode = "i", desc = "Paste image from clipboard" },
    -- Alternative: use leader key if you prefer
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
