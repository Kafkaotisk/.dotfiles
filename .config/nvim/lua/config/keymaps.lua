-- ╔═══════════════════════════════════════════════════════════════════════════╗
-- ║                                                                           ║
-- ║                                N E O V I M                                ║
-- ║                               K E Y M A P S                               ║
-- ║                                                                           ║
-- ╚═══════════════════════════════════════════════════════════════════════════╝

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("x", "<leader>p", [["_dP']], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>zd", [["_d']], { desc = "Delete without yanking" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "+Yank" })
map("n", "<leader>Y", [["+Y]], { desc = "Yanks cursor line" })

map("n", "<C-A-k>", "<cmd>cnext<CR>zz")
map("n", "<C-A-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format current buffer's code" })
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
map("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal" })

-- toggle options
Snacks.toggle.option("tabstops", { name = "Tabstops" }):map("<leader>uE")

-- hljk > hstn (dvorak)
map({ "n", "v" }, "l", "s", { desc = "l > s" })
map({ "n", "v" }, "s", "l", { desc = "s > l" })
map({ "n", "v" }, "t", "j", { desc = "t > j" })
map({ "n", "v" }, "j", "t", { desc = "j > t" })
map({ "n", "v" }, "n", "k", { desc = "n > k" })
map({ "n", "v" }, "k", "n", { desc = "k > n" })
