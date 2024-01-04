-- Use s or S and two characters to jump around in the visible area of the buffer
return {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
        require("leap").add_default_mappings()
    end,
}
