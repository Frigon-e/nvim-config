local status_ok, icons = pcall(require, "nvim-web-devicons")
if vim.g.vscode then return end
if (not status_ok) then
  print("nvim-web-devicons not loaded")
  return
end


icons.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
