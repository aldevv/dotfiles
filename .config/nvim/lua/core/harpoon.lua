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
