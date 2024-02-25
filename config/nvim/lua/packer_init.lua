local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- Color Schemes
	"navarasu/onedark.nvim",

	-- UI
	{
		"kyazdani42/nvim-tree.lua", -- File Tree navigator
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	"nvim-lualine/lualine.nvim", -- Status line at bottom
	"romgrk/barbar.nvim", -- Buffer tab bar
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	-- use 'hrsh7th/cmp-nvim-lsp-signature-help'
	"ray-x/lsp_signature.nvim",
	"jose-elias-alvarez/null-ls.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	-- Editing
	"lukas-reineke/indent-blankline.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	"lewis6991/gitsigns.nvim",
	"terrortylor/nvim-comment",
	"tpope/vim-fugitive",
	"windwp/nvim-autopairs",
	{
		"phaazon/hop.nvim",
		branch = "v2",
	},
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	{
		"kylechui/nvim-surround",
		version = "*",
	},

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
})
