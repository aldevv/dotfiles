-- HARPOON_LOG=trace nvim .
-- vim.g.harpoon_log_level = "trace"
require("harpoon").setup({
    nav_first_in_list = true,
    projects = {
        -- Yes $HOME works
        ["$PROJECTS/main/web/"] = {
            term = {
                cmds = {
                    "yarn dev",
                },
            },
        },
    },
})

require("telescope").load_extension('harpoon')

