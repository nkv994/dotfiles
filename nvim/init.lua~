--vim.cmd('source ~/.config/nvim/init.vim') -- to use init.vim
--vim.cmd('set nocompatible') -- disable compatility to old-time vi
vim.opt.showmatch = false -- show matching
vim.opt.ignorecase = true -- case-insensitive
vim.opt.mouse = 'v' -- middle-click paste with
vim.opt.hlsearch = false -- highlight search
vim.opt.incsearch = false -- incremental search
--vim.opt.tabstop = 4 -- number of columns occupied by a tab
--vim.opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = false -- converts tabs to whitespace
vim.opt.shiftwidth = 4 -- width for autoindents
vim.opt.autoindent = false -- indent a new line the same amount as the line just typed
vim.opt.number = true -- add line numbers
--vim.opt.wildmode = 'longest,list' -- get bash-like tab completions
--vim.opt.cc = 80 -- set an 80 column border for good coding style
vim.cmd('filetype plugin indent on') -- allow auto-indenting depending on filetype
vim.cmd('syntax on') -- syntax highlighting
vim.opt.mouse = 'a' -- enable mouse click
--vim.opt.clipboard = 'unnnamedplus' -- using system clipboard
vim.opt.cursorline = false -- highlight current cursorline
--vim.cmd('set ttyfast') -- speed up scrolling in Vim
vim.opt.spell = false -- enable spell check (may need to download language package)
vim.opt.swapfile = true -- disable creating swap file
--vim.opt.backupdir = '~/.cache/vim' -- directory to store backup files
vim.g.have_nerd_font = true -- to get various nerd font icons
--
--
--- Setting Keymaps ---
local map = vim.keymap.set
-- normal mode --
map("n", "<C-S-Tab>", ":tabprevious<CR>")
map("n", "<C-Tab>",   ":tabnext<CR>")
map("n", "<C-t>",     ":tabnew<CR>")
-- insert mode --
map("i", "<C-S-Tab>", "<Esc>:tabprevious<CR>i")
map("i", "<C-Tab>",   "<Esc>:tabnext<CR>i")
map("i", "<C-t>",     "<Esc>:tabnew<CR>")
--
--
vim.cmd([[
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	call plug#end()
]])
--
--
--- Floating Ranger in Neovim ---
local function open_floating_ranger()
	local tmpfile = vim.fn.tempname()
-- floating window size --
local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local row = math.floor((vim.o.lines - height) / 2)
local col = math.floor((vim.o.columns - width) / 2)
-- create buffer --
local buf = vim.api.nvim_create_buf(false, true)
-- window options --
local win = vim.api.nvim_open_win(buf, true, {
	relative = "editor",
	width = width,
	height = height,
	row = row,
	col = col,
	style = "minimal",
	border = "rounded"
})
-- open ranger in terminal --
vim.fn.termopen({'ranger', '--choosefile='.. tmpfile})
-- enter terminal insert mode --
vim.cmd('startinsert')
-- start ranger --
vim.api.nvim_create_autocmd("TermClose", {
	buffer = buf,
	once = true,
	callback = function()
		vim.api.nvim_win_close(win, true)

		if vim.fn.filereadable(tmpfile) == 1 then
			local file = vim.fn.readfile(tmpfile)[1]
			if file ~= nil and file ~= "" then
				vim.cmd("edit " .. vim.fn.fnameescape(file))
			end
		end
	end,
})
end
-- user command --
vim.api.nvim_create_user_command('Ranger', open_floating_ranger, {})
-- keybinding --
vim.keymap.set('n', '<leader>r', open_floating_ranger, { silent = true })
vim.cmd.colorscheme("morning")
vim.cmd.colorscheme("evening") -- to toggle evening colorscheme
