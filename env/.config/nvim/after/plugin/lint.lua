local ok, lint = pcall(require, 'lint')
if ok then
	lint.linters_by_ft = {
		markdown = { 'markdownlint-cli2' },
	}

    -- ive spent like 3 hours getting this to work
    local markdownlint = lint.linters['markdownlint-cli2']
    markdownlint.args = {
        "--config", vim.fn.expand("~/.markdownlint.yaml"),
        "--",
    }

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end
