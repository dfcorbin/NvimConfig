vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set('n', 'L', '10l')
vim.keymap.set('n', 'H', '10h')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.mapleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,terminal,globals'

-- Setup lazy plugin manager
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
require("lazy").setup("plugins")

require("lsp")
require("ui")
