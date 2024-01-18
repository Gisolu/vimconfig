return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "js",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "jt",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "jrs",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "jts",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
}
