local status_ok, telescope = pcall(require, "telescope")
local status2_ok, builtin = pcall(require, "telescope.builtin")
local status3_ok, actions = pcall(require, "telescope.actions")
if (vim.g.vscode) then return end
if (not status_ok or not status2_ok or not status3_ok) then
  print("Telescope not installed")
  return
end

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local function edit_neovim()
  builtin.find_files({
    shorten_path = true,
    prompt_title = "< Nvim Dot Files >",
    cwd = "~/.config/nvim/",
  })
end

local function edit_current_dir()
  builtin.find_files({
    shorten_path = true,
    prompt_title = "< Current Dir >",
    cwd = telescope_buffer_dir(),
    respect_gitignore = true,
  })
end

local function normal_finder()
  builtin.find_files({
    prompt_title = "< Fuzzy Finder >",
    respect_gitignore = true,
  })
end

telescope.setup {
  defaults = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git", ".cache", "__pycache__", "venv" },
    },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },


  vim.keymap.set('n', '<leader>nf', edit_neovim, {}),
  vim.keymap.set('n', '<leader>ff', edit_current_dir, {}),
  vim.keymap.set('n', '<leader>pf', normal_finder, {}),
  vim.keymap.set('n', '<C-p>', builtin.git_files, {}),
  vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
  end),
}
