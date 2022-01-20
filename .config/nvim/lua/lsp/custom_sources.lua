-- TODO UNTESTED
local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

return h.make_builtin({
    name = "js-beautify",
    method = { FORMATTING, RANGE_FORMATTING },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript",
        "typescript",
        "typescriptreact",
    },
    generator_opts = {
        command = "js-beautify",
        args = h.range_formatting_args_factory({ "$FILENAME" }),
        to_stdin = true,
        dynamic_command = cmd_resolver.from_node_modules,
    },
    factory = h.formatter_factory,
})
