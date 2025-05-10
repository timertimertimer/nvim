return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree filesystem toggle left<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>bf', ":Neotree buffers reveal float<CR>", desc = "NeoTree buffers reveal", silent = true }
  },
  opts = {
    git_status = {
      symbols = {
      -- Change type
      added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
      deleted = "✖", -- this can only be used in the git_status source
      renamed = "󰁕", -- this can only be used in the git_status source        
      -- Status type
      untracked = "",
      ignored = "",
      unstaged = "󰄱",
      staged = "",
      conflict = "",
    }
  },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        show_hidden_count = true,
        never_show = {
          "__pycache__", '.git', '.idea'
        }
      }
    },
  },
}
