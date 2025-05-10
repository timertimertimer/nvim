require("lazy").setup({
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    'tpope/vim-commentary', -- Comment/uncomment lines with hotkey

    require 'colorschemes',
    require 'configs.alpha-nvim', -- Dashboard on nvim startup
    require 'configs.completions',
    require 'configs.which-key',
    require 'configs.gitsigns',
    require 'configs.telescope',
    require 'configs.neo-tree',
    require 'configs.lualine', -- Status bar
    require 'configs.autopairs',
    require 'configs.indent-blankline', -- Vertical line that separates blocks of code

    require 'configs.treesitter', -- Highlight, edit, and navigate code
    require 'configs.lspconfig',
    require 'configs.null-ls',
    require 'configs.dap.nvim-dap',
    require 'configs.dap.nvim-dap-ui',
    require 'configs.dap.nvim-dap-python'
})

require('mason').setup()
vim.cmd [[ colorscheme tokyodark ]]
vim.cmd [[
    highlight NeoTreeGitUntracked guifg=#E5C07B gui=none
    highlight NeoTreeGitModified  guifg=#61AFEF gui=none
    highlight NeoTreeGitDeleted   guifg=#E06C75 gui=none
    highlight NeoTreeGitStaged    guifg=#98C379 gui=bold
    highlight NeoTreeGitConflict  guifg=#BE5046 gui=bold
    highlight NeoTreeGitIgnored   guifg=#5C6370 gui=italic
    highlight NeoTreeGitUnstaged  guifg=#D19A66 gui=none
]]
