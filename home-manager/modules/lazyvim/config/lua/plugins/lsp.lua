return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prisma-language-server",
        "prettier",
        "shfmt",
        "stylua",
        "markdownlint",
      },
    },
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
