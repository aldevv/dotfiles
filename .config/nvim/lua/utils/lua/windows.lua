-- creates a floating window
function show_window()
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(buf, true, {
        relative = 'cursor',
        width = 50,
        height = 3,
        row = 1,
        col = 0,
        border = 'double',
    })
end
