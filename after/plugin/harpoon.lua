local status_ok, mark = pcall(require, "harpoon.mark")
local status2_ok, ui = pcall(require, "harpoon.ui")
if (vim.g.vscode) then return end
if not status_ok or not status2_ok then
  print("harpoon not loaded")
  return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-y>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
