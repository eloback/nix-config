return {
  "rest-nvim/rest.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  keys = {
    { "<leader>rr", "<plug>RestNvim",        desc = "Run HTTP request" },
    { "<leader>rp", "<plug>RestNvimPreview", desc = "Preview HTTP request" },
    { "<leader>rl", "<plug>RestNvimLast",    desc = "Repeat last request" },
    { "<leader>re", "<plug><cmd>lua require('rest-nvim').select_env()",   desc = "Select environment" },
  },
  ft = {
    "http"
  }
}
