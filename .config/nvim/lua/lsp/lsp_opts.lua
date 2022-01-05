local M = {}

-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
local enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
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
                workspace = { --this is for dete
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        }
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
