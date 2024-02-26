return {
	'theprimeagen/harpoon',
	keys = {
		{ "<leader>aa", "<cmd>lua require('harpoon.mark').add_file<cr>",        desc = "Add file to harpoon" },
		{ "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file<cr>",         desc = "Remove file from harpoon" },
		{ "<leader>am", "<cmd>lua require('harpoon.ui').toggle_quick_menu<cr>", desc = "Toggle harpoon menu" },
		{ "<leader>a1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",       desc = "Navigate to harpoon file 1" },
		{ "<leader>a2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",       desc = "Navigate to harpoon file 2" },
		{ "<leader>a3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",       desc = "Navigate to harpoon file 3" },
		{ "<leader>a4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",       desc = "Navigate to harpoon file 4" },
	},
	config = function()
		require("harpoon").setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,
				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,
				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,
				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,
				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },
				-- set marks specific to each git branch inside git repository
				mark_branch = false,
				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			},
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		})
		require("telescope").load_extension("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>aa", mark.add_file, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ar", mark.rm_file, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>am", ui.toggle_quick_menu, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>a1", function() ui.nav_file(1) end, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>a2", function() ui.nav_file(2) end, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>a3", function() ui.nav_file(3) end, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>a4", function() ui.nav_file(4) end, { noremap = true, silent = true })
	end,
}
