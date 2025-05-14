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

outdated = 	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function() 
			require("vscode").setup{
            }

			vim.cmd([[colorscheme vscode]])
		end
	}

require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() 
        require("catppuccin").setup{
            flavor = "mocha"
        }

        vim.cmd([[colorscheme catppuccin-mocha]])
        end,
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
			vim.api.nvim_set_keymap('n', "<C-o>", ":Telescope find_files<CR>", { noremap=true, silent=true })
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
			vim.api.nvim_set_keymap('n', "<C-p>", ":ShowBufferList<CR>", { noremap=true, silent=true })
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
			vim.api.nvim_set_keymap('n', "<C-e>", ":Neotree<CR>", { noremap=true, silent=true })

			require('neo-tree').setup {
                filesystem = {
                    filtered_items = {
                        visible = true
                    }
                },
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
	},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x', 
		config = function()
			local lsp_zero = require('lsp-zero')

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = {buffer = bufnr}

				vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
			})

			require 'lspconfig'.clangd.setup{}
			require 'lspconfig'.rust_analyzer.setup{}
			require 'lspconfig'.gopls.setup{}

			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{name = 'nvim_lsp'},
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
					   ['<C-f>'] = cmp.mapping.scroll_docs(4),
					   ['<C-Space>'] = cmp.mapping.complete(),
					   ['<C-e>'] = cmp.mapping.abort(),
					   ['<Tab>'] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end
	},
	{'neovim/nvim-lspconfig'
},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'windwp/nvim-autopairs', 
		event = "InsertEnter", 
		config = true
	}
}, {});

