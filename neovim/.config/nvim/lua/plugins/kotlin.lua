return {
  -- Disable the default kotlin_language_server from LazyVim extra
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = { enabled = false },
        kotlin_lsp = {},
      },
    },
  },
}
