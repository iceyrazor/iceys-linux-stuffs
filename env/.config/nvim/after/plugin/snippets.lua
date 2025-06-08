local ok, luasnip= pcall(require, 'luasnip')
if ok then
    luasnip.filetype_extend("javascript", { "jsdoc" })
    luasnip.filetype_extend("lua", { "luadoc" })
    luasnip.filetype_extend("rust", { "rustdoc" })
    luasnip.filetype_extend("c", { "cdoc" })

    vim.keymap.set({"i"}, "<C-s>e", function() luasnip.expand() end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-s>;", function() luasnip.jump(1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-s>,", function() luasnip.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
        if luasnip.choice_active() then
            luasnip.change_choice(1)
        end
    end, {silent = true})
end
