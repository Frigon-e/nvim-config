local status_ok, nvimtree = pcall(require, "nvim-tree")
if (vim.g.vscode) then return end
if (not status_ok) then
  print("nvim-tree not loaded")
  return
end

-- OR setup with some options
nvimtree.setup({

  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
      },
    },
  },
  filter = {
    custom = {
      '^node_modules$',
      '^__pycache__$',
      '^git$',
    }
  },
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      error = ' ',
      warning = ' ',
      info = ' ',
      hint = ' '
    },
  },

})

vim.keymap.set("n", "<leader>pd", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
