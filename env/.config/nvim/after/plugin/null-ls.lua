local ok, null_ls = pcall(require, 'null-ls')
if ok then
    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.markdownlint_cli2,
        },
    })
end
