require("lazy").setup({
    require 'colorschemes',
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    require 'configs.treesitter',
    require 'configs.which-key',
    require 'configs.gitsigns',
    require 'configs.telescope',
    require 'configs.neo-tree',
})

vim.cmd [[ colorscheme catppuccin ]]
