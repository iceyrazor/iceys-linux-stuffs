local ok, dap = pcall(require, 'dap')
if ok then
    -- vim.api.nvim_set_hl(namespace, 'DapBreakpoint', { fg='#993939', bg='#31353f' })
    -- vim.api.nvim_set_hl(namespace, 'DapLogPoint', { fg='#61afef', bg='#31353f' })
    -- vim.api.nvim_set_hl(namespace, 'DapStopped', { fg='#98c379', bg='#31353f' })

    -- Reuse current SignColumn background (except for DapStoppedLine)
    local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
    -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
    -- convert to 6 digit hex value starting with #
    local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
    local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

    vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#c23127', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#888ca6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = sign_column_bg, ctermbg = sign_column_ctermbg })


    vim.fn.sign_define('DapBreakpoint', { text='•', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })


    local ok, dapui = pcall(require, 'dapui')
    if ok then
        dapui.setup()

        vim.keymap.set("n", "<Leader>dl", function() dap.step_into() end)
        vim.keymap.set("n", "<Leader>dj", function() dap.step_over() end)
        vim.keymap.set("n", "<Leader>dk", function() dap.step_out() end)
        vim.keymap.set("n", "<Leader>dc", function() dap.continue() end)
        vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end)
        vim.keymap.set("n", "<Leader>dB", function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end)
        vim.keymap.set("n", "<Leader>dd", function() dap.terminate() end)
        vim.keymap.set("n", "<Leader>dr", function() dap.run_last() end)
        --vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<Cr>")
        vim.keymap.set("n", "<Leader>ds", function() dapui.toggle() end)

        --[[
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        ]]--
    end

    dap.configurations.rust = {
        {
            name = "Launch",
            type = "codelldb",
            request = "launch",
            program = function()
                --return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                if vim.fn.expand("%:t:r") == "main" then
                    return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                else
                    return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnameescape(vim.fn.expand("%:t:r"))
                end
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }
end
