-- ===========
-- LSP SERVERS
-- ===========
-- this installs them automatically
local servers = {
    "bashls",
    "pyright",
    "html",
    "cssls",
    "jdtls", -- java
    "zk", -- markdown
    "tsserver",
    "tailwindcss",
    "svelte",
    "sumneko_lua",
    "vimls",
    "gopls",
    "dockerls",
    "jsonls",
    "yamlls",
    "rust_analyzer",
    "volar", -- vue
    "sqlls",
    "hls", -- haskell
    "solargraph", -- ruby
    "emmet_ls",
    "graphql",
}
local lsp_installer_servers = require("nvim-lsp-installer.servers")
for _, server in ipairs(servers) do
    local _, requested_server = lsp_installer_servers.get_server(server)
    if not requested_server:is_installed() then
        requested_server:install()
    end
end

local handlers = {}
-- ===================
-- LSP FLOATING WINDOW
-- ===================

-- this is so is not overwritten by my colorscheme
vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

-- local border = {
--       {"🭽", "FloatBorder"},
--       {"▔", "FloatBorder"},
--       {"🭾", "FloatBorder"},
--       {"▕", "FloatBorder"},
--       {"🭿", "FloatBorder"},
--       {"▁", "FloatBorder"},
--       {"🭼", "FloatBorder"},
--       {"▏", "FloatBorder"},
-- }
--
-- local border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
-- local border = "single"
-- local border = "double"
-- local border = "shadow"
local border = "rounded"
-- local border = "solid"

-- ==============
-- HANDLERS
-- ==============
-- LSP settings (for overriding per client)
local lsp_handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    ["textDocument/completion"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

for k, v in pairs(lsp_handlers) do
    handlers[k] = v
end

-- ============
-- DIAGNOSTICS
-- ============

local diagnostic_handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            spacing = 2,
        },
        signs = true,
        update_in_insert = true,
    }),
}
for k, v in pairs(diagnostic_handlers) do
    handlers[k] = v
end

-- =====
-- LSP
-- =====

local lsp_opts = require("lsp.lsp_opts")
local lsp_installer = require("nvim-lsp-installer")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function()
    -- these are callbacks that run after the server has loaded
    require("config.keybindings.lsp").load_mappings()
    require("config.automation.lsp").diagnostics_in_loclist()
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        handlers = handlers,
        on_attach = on_attach,
    }

    if lsp_opts.enhanceable(server.name) then
        lsp_opts.enhance(server.name, opts)
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
