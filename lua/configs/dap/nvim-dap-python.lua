return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require('dap-python')
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    dap.setup(path)
    vim.keymap.set("n", "<leader>dpr", function()
      dap.test_method()
    end, { desc = "Run Python test method", noremap = true, silent = true })
  end,
}
