return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Options: "latte", "macchiato", "frappe", "mocha"
			integrations = {
				treesitter_context = true,
				telescope = {
					enabled = true,
				},
				dap = true,
				lsp_trouble = true,
				harpoon = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
