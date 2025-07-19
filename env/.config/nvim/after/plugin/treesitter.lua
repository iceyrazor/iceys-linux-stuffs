local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ok then
    treesitter.setup {
        ensure_installed = { "c", "lua", "rust", "css", "html", "bash", "markdown", "markdown_inline" },
        highlight = { enable = true, },
    }
end
