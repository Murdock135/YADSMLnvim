-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Python repl
vim.keymap.set("n", "C-d", function()
  require("nvim-python-repl").send_statement_definition()
end, { desc = "Send semantic unit to REPL" })

vim.keymap.set("v", "C-<CR>", function()
  require("nvim-python-repl").send_visual_to_repl()
end, { desc = "Send visual selection to REPL" })

vim.keymap.set("n", "C-b", function()
  require("nvim-python-repl").send_buffer_to_repl()
end, { desc = "Send entire buffer to REPL" })

vim.keymap.set("n", "C-a-<CR>", function()
  require("nvim-python-repl").toggle_execute()
end, { desc = "Automatically execute command in REPL after sent" })

vim.keymap.set("n", "C-v-<CR>", function()
  require("nvim-python-repl").toggle_vertical()
end, { desc = "Create REPL in vertical or horizontal split" })

vim.keymap.set("n", "C-w-<CR>", function()
  require("nvim-python-repl").open_repl()
end, { desc = "Opens the REPL in a window split" })
