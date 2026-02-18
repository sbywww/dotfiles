return {
  "b0o/incline.nvim",
  event = "BufRead",
  opts = {
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)
      return {
        { " " .. (icon or "") .. " ", guifg = color },
        { filename .. " " },
      }
    end,
  },
}
