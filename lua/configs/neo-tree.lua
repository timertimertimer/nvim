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
    { '<C-n>', ':Neotree filesystem toggle left<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>bf', ":Neotree buffers reveal float<CR>", desc = "NeoTree buffers refeal", silent = true }
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {
          "__pycache__", '.git', '.idea'
        }
      }
    },
  },
}
