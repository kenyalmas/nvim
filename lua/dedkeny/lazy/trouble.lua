return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "[t",
      function()
        require("trouble").next({ skip_groups = true, jump = true })
      end,
      desc = "Trouble Next",
    },
    {
      "]t",
      function()
        require("trouble").prev({ skip_groups = true, jump = true })
      end,
      desc = "Trouble Previous",
    },
  },
}
