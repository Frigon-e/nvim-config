vim.opt.signcolumn = 'yes'

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

local status_ok, zero_lsp = pcall(require, "lsp-zero")
local status2_ok, lspkind = pcall(require, "lspkind")
if (vim.g.vscode) then return end
if not status_ok or not status2_ok then
  print("lsp-zero not loaded")
  return
end

zero_lsp.preset('recommended')


zero_lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'eslint',
  'html',
  'pylsp',
  'tailwindcss',
})



local status3_ok, capabilities = pcall(require, "cmp_nvim_lsp")
if (not status3_ok) then
  print("cmp_nvim_lsp not loaded")
  return
end
capabilities = capabilities.default_capabilities()



zero_lsp.configure('tsserver', {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
})

-- Fix Undefined global 'vim'
zero_lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

zero_lsp.configure('tailwindcss', {
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  cmd = { "tailwindcss-language-server", "--stdio" },
  capabilities = capabilities
})

-- Sets the mapping for the LSP client
local status4_ok, cmp = pcall(require, "cmp")
if (not status4_ok) then
  print("cmp not loaded")
  return
end
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = zero_lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<Enter>'] = nil


zero_lsp.setup_nvim_cmp({
  -- This sets default mappings for nvim-cmp
  mapping = cmp_mappings,

  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'vsnip' },
    { name = 'nvim_treesitter' },

  },
  -- This sets the snippet look for nvim-cmp
  -- uses LspKind Icons
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        luasnip = "[LuaSnip]",
        path = "[Path]",
        calc = "[Calc]",
        vsnip = "[Snippet]",
        nvim_treesitter = "[Treesitter]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

zero_lsp.set_preferences({
  sign_icons = {
    error = '??? ',
    warn = '??? ',
    info = '??? ',
    hint = '??? '
  }
})

zero_lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, opts)

end)

zero_lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
