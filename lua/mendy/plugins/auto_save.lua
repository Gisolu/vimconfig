-- Auto save the current buffer
return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup()
    end,
}
