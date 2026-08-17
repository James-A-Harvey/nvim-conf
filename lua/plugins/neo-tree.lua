-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>fr",  ":Neotree left toggle reveal<CR>",     desc = "NeoTree reveal",        silent = true },
		{ "<leader>fg",  ":Neotree left toggle git_status<CR>", desc = "NeoTree git status",    silent = true },
		{ "<leader>fb",  ":Neotree left toggle buffers <CR>",   desc = "Neotree buffers",       silent = true },
		{ "<leader>ffr", ":Neotree float reveal<CR>",           desc = "NeoTree float reveal",  silent = true },
		{ "<leader>ffb", ":Neotree float buffers<CR>",          desc = "Neotree float buffers", silent = true },
		{ "<leader>ffg", ":Neotree float git_status<CR>",       desc = "Neotree float buffers", silent = true },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
