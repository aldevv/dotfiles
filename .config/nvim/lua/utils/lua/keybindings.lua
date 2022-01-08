local M = {}
-- copilot
M.toggle_copilot = function()
    if vim.g.copilot_enabled == 1 then
        print("Disabling copilot")
        vim.api.nvim_command("Copilot disable")
    else
        print("Enabling copilot")
        vim.api.nvim_command("Copilot enable")
    end
end
return M

