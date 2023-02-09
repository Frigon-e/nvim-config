local status_ok, blankline = pcall(require, "indent_blankline")
if (vim.g.vscode) then return end
if not status_ok then
  print("indent_blankline not loaded")
  return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol: "

blankline.setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
}
