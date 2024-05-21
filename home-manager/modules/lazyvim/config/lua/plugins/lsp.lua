return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = {
          settings = {
            ['nil'] = {
              formatting = {
                command = { "nixpkgs-fmt" },
              }
            }
          }
        }
      },
    },
  }
}
