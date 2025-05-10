return {
  "mfussenegger/nvim-dap",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
      { noremap = true, silent = true })
  end,
}
