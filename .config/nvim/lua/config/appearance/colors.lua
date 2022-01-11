-- cmp
-- do nvim --headless to see errors, guifg was MISSING
vim.cmd([[
    augroup cmp
        execute 'hi! CmpItemAbbr guifg=' . HighGet("String")
    augroup END
]])

-- hop
--
vim.cmd([[
    execute 'hi HopNextKey2 gui=bold guifg=LightGreen'
]])
-- vim.cmd("execute 'hi HopNextKey2 ' . HighGet('HopNextKey')")
