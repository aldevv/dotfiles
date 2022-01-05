-- cmp
vim.cmd([[
    augroup cmp
        execute 'hi! CmpItemAbbr ' . HighGet("String")
    augroup END
]])

-- hop
--
vim.cmd([[
    execute 'hi HopNextKey2 gui=bold guifg=LightGreen'
]])
-- vim.cmd("execute 'hi HopNextKey2 ' . HighGet('HopNextKey')")
