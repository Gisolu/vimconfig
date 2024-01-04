return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Lazy load crumb navigation on code context
        -- For example, enables you to quickly list all code contexts (class, method, etc) in current file and quickly switch to it
        -- Needs to be loaded before lsp as a dependency
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                {
                    "SmiteshP/nvim-navic",
                    opts = {
                        lsp = {
                            auto_attach = true,
                        },
                    }
                },
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        },
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim',       opts = {} },
        -- Additional lua configuration, makes nvim stuff amazing!
        { 'folke/neodev.nvim',       opts = {} },
    },
}
