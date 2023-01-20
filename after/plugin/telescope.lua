local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

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
    defaults ={
        file_ignore_patterns = { "node_modules", ".git", ".cache", "__pycache__", "venv"},
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


  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["%"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}


require("telescope").load_extension "file_browser"

vim.keymap.set("n", "<leader>pv", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
