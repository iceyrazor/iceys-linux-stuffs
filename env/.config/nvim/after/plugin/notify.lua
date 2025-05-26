local ok, notify = pcall(require, 'notify')
if ok then
    vim.notify = notify
    notify.setup({
        background_colour="#000000"
    })
end
