local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function() 
			require("vscode").setup{
			}

			vim.cmd([[colorscheme vscode]])
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function() 
			require("nvim-treesitter.configs").setup {
				highlight = {
					enable = true
				}
			}
		end,
	},
	{
		"nvim-telescope/telescope.nvim", 
		tag = "0.1.6", 
		dependencies = { 
			"nvim-lua/plenary.nvim"
		},
		config = function() 
			vim.api.nvim_set_keymap('n', "<C-p>", ":Telescope find_files<CR>", { noremap=true, silent=true })
			vim.api.nvim_set_keymap('n', "<C-f>", ":Telescope live_grep<CR>", { noremap=true, silent=true })

			require("telescope").setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"CMakeFiles",
						"CMakeCache",
						"Makefile",
						"cmake_install.make",
						"temp"
					}
				}
			}
		end
	},
	{
		"PhilRunninger/bufselect", 
		config = function()
			vim.api.nvim_set_keymap('n', "<leader>b", ":ShowBufferList<CR>", { noremap=true, silent=true })
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}, 
		config = function ()
			require('neo-tree').setup {
				default_component_configs = {
					icon = {
						default = " ",
					},
				},
				window = {
					mappings = {
						["o"] = "open"
					}
				}
			}
		end,
	}
}, {});

