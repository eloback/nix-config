return {
  {},
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
    keys = {
      { "<leader>rd", "<cmd>DBUIToggle<cr>", desc = "Toggle dadbod-ui" },
      { "<leader>rf", "<Cmd>DBUIFindBuffer<Cr>", desc = "Find buffer" },
      { "<leader>rq", "<Cmd>DBUILastQueryInfo<Cr>", desc = "Last query info" },
    },
  },
}
