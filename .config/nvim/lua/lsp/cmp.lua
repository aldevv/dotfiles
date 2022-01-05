-- =========
-- LSPKIND
-- ========
local lspkind = require("lspkind")
lspkind.init({
    -- preset: 'default' or  'codicons'
    preset = "default",
    with_text = true,
    symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "ﬦ",
        Constructor = "",
        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "了",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
    },
})

-- ==========
-- COMPLETION
-- ==========
vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                -- nvim_lsp = "ﲳ",
                -- nvim_lsp = "📚",
                nvim_lsp = "[LS]",
                nvim_lua = "[api]",
                -- treesitter = "",
                treesitter = "🌲",
                -- path = "ﱮ",
                path = "📁",
                -- buffer = "﬘",
                buffer = "[buf]",
                zsh = "[sh]",
                -- vsnip = "",
                ultisnips = "🔥",
                -- spell = "暈",
                spell = "暈",
            })[entry.source.name]

            return vim_item
        end,
    },
    experimental = {
        ghost_text = true,
        -- native_menu = true
    },
    mapping = {
        ["<a-e>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<a-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<a-u>"] = function(fallback)
            if cmp.visible() then
                for _ = 1, 2 do
                    cmp.select_prev_item()
                end
            else
                fallback()
            end
        end,
        ["<a-d>"] = function(fallback)
            if cmp.visible() then
                for _ = 1, 2 do
                    cmp.select_next_item()
                end
            else
                fallback()
            end
        end,
        -- these are for the popup docs, TODO change to the ones in coc
        ["<C-e>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
            cmp.ConfirmBehavior.Insert, -->https://github.com/hrsh7th/nvim-cmp/issues/664
            select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "ultisnips" }, -- For ultisnips users.
        -- these below also need a plugin like cmp-nvim-ultisnips
        { name = "path", max_item_count = 10 },
        -- { name = 'luasnip' }, TODO change to this!
        { name = "buffer", keyword_length = 5 },
        -- { name = 'snippy' }, -- For snippy users.
        -- { name = 'treesitter' },
    },
})
