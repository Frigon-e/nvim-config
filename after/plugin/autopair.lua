local status_ok, autopairs = pcall(require, "nvim-autopairs")
if (vim.g.vscode) then return end
if (not status_ok) then
  print("nvim-autopairs not loaded")
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" },
})
