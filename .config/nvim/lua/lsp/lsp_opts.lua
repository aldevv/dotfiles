local M = {}
-- :h lspconfig-root-advanced
-- :h lspconfig-root-composition
local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
local enhance_server_opts = {
    ["tsserver"] = function(opts)
        -- :h lspconfig-root-advanced
        -- :h lspconfig-root-composition
        -- root_dir is a function
        --
        -- :h lspconfig-root-dir
        opts.root_dir = function(fname)
            return util.root_pattern("tsconfig.json")(fname)
                or util.root_pattern("package.json", "jsconfig.json", ".git", ".projections.json")(fname)
        end
    end,

    ["pylsp"] = function(opts)
        opts.settings = {
            pylsp = {
                plugins = {
                    jedi_completion = {
                        include_params = true, -- this line enables snippets
                    },
                },
            },
        }
    end,
    ["sumneko_lua"] = function(opts)
        local runtime_path = vim.split(package.path, ";")
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        opts.settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        }
        opts.root_dir = function(fname)
            return util.find_git_ancestor(fname) or util.path.dirname(fname)
        end
    end,

    ["eslintls"] = function(opts)
        opts.settings = {
            format = {
                enable = true,
            },
        }
    end,
}
function M.enhanceable(name)
    for key, _ in pairs(enhance_server_opts) do
        if name == key then
            return true
        end
    end
    return false
end

function M.enhance(name, opts)
    enhance_server_opts[name](opts)
end

return M
