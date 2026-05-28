-- this is where "Workflow pluggins go, so nothing to do with code"
return {
	"tpope/vim-sleuth",
	-- git from within nvim
	"tpope/vim-fugitive",
	-- surround, allows surrounding text
	"tpope/vim-surround",
	-- sql in vim
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod",                     lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mssql", "sqlserver" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	-- highlight when pressing f,F,t,T
	{
		"unblevable/quick-scope",
		init = function()
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
			vim.cmd([[highlight QuickScopePrimary guifg='#5fffff' gui=underline,bold ctermfg=155 cterm=underline,bold]])
			vim.cmd(
				[[highlight QuickScopeSecondary guifg='#afff5f' gui=underline,bold ctermfg=81 cterm=underline,bold]]
			)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},
			-- Document existing key chains
			spec = {
				{ "<leader>s",  group = "[S]earch" },
				{ "<leader>f",  group = "[F]ile" },
				{ "<leader>ft", group = "[T]oggle" },
				{ "<leader>t",  group = "[T]est" },
				{ "<leader>h",  group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},
	-- other plugnins
	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = "default",
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
					-- add vim-dadbod-completion to your completion providers
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink", score_offset = 900 },
				},
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
			},

			cmdline = {
				keymap = {
					-- recommended, as the default keymap will only show and select the next item
					["<Tab>"] = { "show", "accept" },
				},
				completion = { menu = { auto_show = true } },
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"dimtion/guttermarks.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "FileType" },
	},
}
