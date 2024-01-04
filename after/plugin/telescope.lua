local telescope = require("telescope.builtin")
-- Basic keymaps for telescope
vim.keymap.set("n", "<leader>sf", telescope.find_files, {})
vim.keymap.set("n", "<leader>sg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>sb", telescope.buffers, {})
vim.keymap.set("n", "<leader>sh", telescope.help_tags, {})
vim.keymap.set("n", "<leader>sc", telescope.commands, {})
vim.keymap.set("n", "<leader>sl", telescope.loclist, {})
vim.keymap.set("n", "<leader>sq", telescope.quickfix, {})
vim.keymap.set("n", "<leader>sr", telescope.registers, {})
vim.keymap.set("n", "<leader>sd", telescope.diagnostics, {})
vim.keymap.set("n", "<leader>sp", telescope.planets, {}) -- Some telescope humor
vim.keymap.set("n", "<leader>s?", telescope.oldfiles, {})
vim.keymap.set("n", "<leader>gsb", telescope.git_branches, {})
vim.keymap.set("n", "<leader>gsc", telescope.git_commits, {})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- File browser setup
require("telescope").load_extension "file_browser"
-- 1. Open folder root
vim.api.nvim_set_keymap(
    "n",
    "<space>br",
    ":Telescope file_browser<CR>",
    { noremap = true }
)
-- 2. Open folder at current file
vim.api.nvim_set_keymap(
    "n",
    "<space>b",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

-- Harpoon integration
local harpoon = require("harpoon")
harpoon.setup({})
vim.keymap.set("n", "<leader>m", function() harpoon:list():append() end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-/>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-.>", function() harpoon:list():next() end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<M-h>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
