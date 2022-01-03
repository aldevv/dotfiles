-- ==========
-- COMPLETION
-- ==========
vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

local cmp = require('cmp')
cmp.setup {
  mapping = {
      ['<a-e>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<a-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      -- these are for the popup docs, TODO change to the ones in coc
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
  sources = {
    { name = 'nvim_lsp' }
   -- these below also need a plugin like cmp-nvim-ultisnips
   -- { name = 'luasnip' }, -- For luasnip users.
   -- { name = 'ultisnips' }, -- For ultisnips users.
   -- { name = 'snippy' }, -- For snippy users.
  }
}
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


-- ===========
-- LSP SERVERS
-- ===========
-- this installs them automatically
local servers = {"pyright",  "html",  "tsserver", "tailwindcss", "svelte", "sumneko_lua" }
local lsp_installer_servers = require'nvim-lsp-installer.servers'
for _, server in ipairs(servers) do
    local _, requested_server = lsp_installer_servers.get_server(server)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end

-- =====
-- LSP
-- =====
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

