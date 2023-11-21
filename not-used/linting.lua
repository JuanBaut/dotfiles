return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			linters = {
				eslint = {
					command = "eslint",
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "unix" },
				},
			},
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Make Linting" })
	end,
}
