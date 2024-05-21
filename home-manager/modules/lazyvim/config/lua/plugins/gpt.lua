return {
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "pass show api/tokens/openai",
      })
    end,
    keys = {
      { "<leader>oo", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = { "n", "v" } },
      { "<leader>or", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPTActAs", mode = { "n", "v" } },
      { "<leader>oe", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "ChatGPTEditWithInstructions", mode = { "n", "v" } },
      { "<leader>oc", "<cmd>ChatGPTCompleteCode<cr>", desc = "ChatGPTCompleteCode", mode = { "n", "v" } },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
