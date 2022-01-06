local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.5 },
            -- other layout configuration here
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse, --select
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<a-n>"] = actions.move_selection_next,
                ["<a-e>"] = actions.move_selection_previous,
                ["<a-u>"] = actions.move_selection_next,
                ["<a-d>"] = actions.move_selection_previous,
                ["<c-e>"] = actions.preview_scrolling_up,
                ["<c-n>"] = actions.preview_scrolling_down,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --sends one
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- sends all
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["?"] = actions.which_key,
            },
        },
        -- other defaults configuration here
    },
    -- other configuration values here
})
