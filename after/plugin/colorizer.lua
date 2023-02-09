local status_ok, colorizer = pcall(require, "colorizer")
if (vim.g.vscode) then return end
if (not status_ok) then
  print("colorizer not loaded")
  return
end

colorizer.setup({
  '*';
})
