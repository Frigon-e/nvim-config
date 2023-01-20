vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Move Seclection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below onto current line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "K", "t<Space>lr<cr>k$")

-- Center screen for vertical movements
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- QuickFix list movements
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "Q", "<nop>")
-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Search highlighted object
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make executeable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- New tab
vim.keymap.set('n', 'te', ':tabedit<Return>')

-- Split window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('', 'sh', '<C-w>h')
vim.keymap.set('', 'sk', '<C-w>k')
vim.keymap.set('', 'sj', '<C-w>j')
vim.keymap.set('', 'sl', '<C-w>l')

-- Resize window
vim.keymap.set('n', '<C-w>h', '<C-w>>')
vim.keymap.set('n', '<C-w>k', '<C-w>+')
vim.keymap.set('n', '<C-w>j', '<C-w>-')
vim.keymap.set('n', '<C-w>l', '<C-w><')

-- Tab Traversal
vim.keymap.set('n', '<Tab>', 'gt', {})
vim.keymap.set('n', '<S-Tab>', 'gT', {})
