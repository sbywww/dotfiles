return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>-", function() require("oil").toggle_float() end, desc = "Oil float" },
  },
  opts = {
    default_file_explorer = true,
    view_options = { show_hidden = true },
  },
}
