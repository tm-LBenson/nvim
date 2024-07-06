require("lazy").setup({
    -- Packer can manage itself
    {"wbthomason/packer.nvim"},

    -- UndoTree, loaded on demand with a command
    {"mbbill/undotree", commands = {"UndoTreeToggle"}},

    -- Harpoon, loaded on demand with commands
    {"ThePrimeagen/harpoon", commands = {"HarpoonMark", "HarpoonToggleQuickMenu"}},

    -- Fugitive for Git, loaded when any Git operation is called
    {"tpope/vim-fugitive", commands = {"G", "Git", "Gdiff"}},

    -- NERDTree and associated icon support, loaded with commands
    {"preservim/nerdtree", commands = {"NERDTreeToggle", "NERDTreeFind"}},
    {"kyazdani42/nvim-web-devicons", event = "VimEnter"},

    -- Visual Multi, loaded on visual mode enter
    {"mg979/vim-visual-multi", keys = {"<C-n>", "<C-d>", "gb"}},

    -- Dashboard, loaded on VimEnter
    {"glepnir/dashboard-nvim", event = "VimEnter"},

    -- Telescope, loaded on command call
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        commands = {"Telescope"},
        dependencies = {"nvim-lua/plenary.nvim"}
    },

    -- Treesitter, loaded on buffer read and new file
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = {"BufRead", "BufNewFile"},
        config = function()
            require('nvim-treesitter.configs').setup {
                -- your treesitter configurations here
            }
        end
    },

    -- Rose-pine theme, loaded on VimEnter
    {
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
        event = "VimEnter"
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = {"kyazdani42/nvim-web-devicons"}
    },

    -- Null-ls for linting and formatting, loaded on VimEnter
    {"jose-elias-alvarez/null-ls.nvim", event = "VimEnter"},

    -- Prettier plugin, loaded on VimEnter
    {"MunifTanjim/prettier.nvim", event = "VimEnter"},

    -- LSP configurations, loaded on VimEnter
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        event = "VimEnter",
        dependencies = {
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            {"neovim/nvim-lspconfig"},
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"L3MON4D3/LuaSnip"}
        }
    },
})
