local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if (vim.g.vscode) then return end
if (not status_ok) then
  print("nvim-ts-autotag not loaded")
  return
end

autotag.setup({})
