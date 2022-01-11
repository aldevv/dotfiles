local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
local configs = require("lsp.dap-configs")
dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

-- https://github.com/mfussenegger/nvim-dap/wiki/Cookbook
-- function is_installed(d, d_installed)
--     for _, installed in ipairs(d_installed) do
--         if d == installed then
--             return true
--         end
--     end
--     return false
-- end

-- for lua you need to run :lua require('osv').launch(), and then use
-- require('osv').run_this(), since the debugger interface is not working
local debuggers = { "python", "lua"}

local level = "ERROR" -- error, debug, info, warn?
require("dap").set_log_level(level)

for _, d in ipairs(debuggers) do
    -- TODO not working since it opens new terminal, check later 06/01/22
    -- if not is_installed(d, dbg_list) then
    --     vim.cmd(":DII " .. d)
    -- end
    local opts = {}
    if configs.configExists(d) then
        opts = vim.tbl_extend("keep", opts, configs.configurate(d))
    end
    dap_install.config(d, opts)
end
-- require('dap.ext.vscode').load_launchjs()

-- open dapui automatically
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
-- autocompletion for repl
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])

dap.defaults.fallback.external_terminal = {
    command = "st",
    args = { "-e" },
}
dap.defaults.fallback.force_external_terminal = false
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "l", -- Edit the value of a variable
        repl = "r", -- send variable to repl
    },
    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})

-- require("dapui").float_element(<element ID>, <optional settings>)

-- virtual text

require("nvim-dap-virtual-text").setup({
    enabled = true, -- enable this plugin (the default)
    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true, -- show stop reason when stopped for exceptions
    commented = false, -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

-- custom commands

local repl = require("dap.repl")
repl.commands = vim.tbl_extend("force", repl.commands, {
    -- Add a new alias for the existing .exit command
    exit = { "exit", ".exit", ".bye" },
    -- Add your own commands; run `.echo hello world` to invoke
    -- this function with the text "hello world"
    custom_commands = {
        [".echo"] = function(text)
            dap.repl.append(text)
        end,
        -- Hook up a new command to an existing dap function
        [".restart"] = dap.restart,
    },
})

local s = { silent = true }
local nor = { noremap = true }
local nor_s = vim.tbl_extend("keep", nor, s)

local map = vim.api.nvim_set_keymap

-- nvim-dap
map("n", "<leader>cdl", ":lua require'dap'.list_breakpoints()<cr>", nor_s)
map("n", "<leader>cdb", ":lua require'dap'.toggle_breakpoint()<cr>", nor_s)

map("n", "<leader>cdBc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", nor_s)
map("n", "<leader>cdBh", ":lua require'dap'.set_breakpoint(nil, vim.fn.input('Hit count: '))<cr>", nor_s)
map("n", "<leader>cdBl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", nor_s)
map("n", "<leader>cdBe", ":lua require'dap'.set_exception_breakpoints()<cr>", nor_s) -- 'never' | 'always' | 'unhandled' | 'userUnhandled';
map("n", "<leader>cdBC", ":lua require'dap'.run_to_cursor()<cr>", nor_s)

-- docs:
-- h dap.reverse_continue
map("n", "<leader>cdmt", ":lua require'dap'.terminate{}<cr>", nor_s) -- terminate
map("n", "<leader>cdmr", ":lua require'dap'.restart()<cr>", nor_s)

map("n", "<leader>cdu", ":lua require'dap'.up()<cr>", nor_s)
map("n", "<leader>cdd", ":lua require'dap'.down()<cr>", nor_s)
map("n", "<leader>cdg", ":lua require'dap'.goto_()<cr>", nor_s) -- not all debuggers support it
map("n", "<leader>cdh", ":lua require'dap.ui.widgets'.hover()<cr>", nor_s)
map("n", "<leader>cdp", ":lua require'dap'.pause()<cr>", nor_s)
map("n", "<leader>cdc", ":lua require'dap'.continue()<cr>", nor_s)
map("n", "<leader>cdC", ":lua require'dap'.reverse_continue()<cr>", nor_s) -- Continues execution reverse in time until last breakpoint. Debug adapter must support reverse debugging.
-- map("n", "<leader>cdr", ":lua require'dap'.run()<cr>", nor_s) -- continue already calls this
map("n", "<leader>cdr", ":lua require'dap'.run_last()<cr>", nor_s)
map("n", "<leader>cde", ":lua require('utils.lua.dap').eval()<cr>", nor_s)
map("v", "<leader>cde", ":lua require('dapui').eval()<cr>", nor_s)

map("n", "<leader>cdn", ":lua require'dap'.step_over()<cr>", nor_s)
map("n", "<leader>cdsn", ":lua require'dap'.step_over()<cr>", nor_s)
map("n", "<leader>cdsi", ":lua require'dap'.step_into()<cr>", nor_s)
map("n", "<leader>cdso", ":lua require'dap'.step_out()<cr>", nor_s)
map("n", "<leader>cdsb", ":lua require'dap'.step_back()<cr>", nor_s)

