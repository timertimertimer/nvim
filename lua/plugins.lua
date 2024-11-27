require("lazy").setup({
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    require 'colorschemes',
    require 'configs.treesitter',
    require 'configs.which-key',
    require 'configs.gitsigns',
    require 'configs.telescope',
    require 'configs.neo-tree',
})

vim.cmd [[ colorscheme material ]]
