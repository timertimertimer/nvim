require("lazy").setup({
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    'tpope/vim-commentary',
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',

    require 'colorschemes',
    require 'configs.treesitter',
    require 'configs.which-key',
    require 'configs.gitsigns',
    require 'configs.telescope',
    require 'configs.neo-tree',
    require 'configs.lualine',
    require 'configs.autopairs',
    require 'configs.indent-blankline',
    require 'configs.lspconfig',
    require 'configs.null-ls',
})

require('mason').setup()
vim.cmd [[ colorscheme material ]]
