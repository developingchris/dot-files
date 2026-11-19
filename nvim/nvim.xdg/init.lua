-- leader has to be set before plugins load so their mappings pick it up
vim.g.mapleader = ','

-- bootstrap lazy.nvim, the plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  change_detection = { notify = false },
})

-- options (things like syntax, autoread, incsearch, hlsearch, wildmenu are
-- already on by default in neovim)
local opt = vim.opt
opt.backupcopy = 'yes'                                        -- see :help crontab
opt.clipboard = 'unnamed'                                     -- yank and paste with the system clipboard
opt.expandtab = true                                          -- expand tabs to spaces
opt.ignorecase = true                                         -- case-insensitive search
opt.smartcase = true                                          -- case-sensitive search if any caps
opt.list = true                                               -- show trailing whitespace
opt.listchars = { tab = '▸ ', trail = '▫' }
opt.number = true                                             -- show line numbers
opt.scrolloff = 3                                             -- show context above/below cursorline
opt.shiftwidth = 2                                            -- normal mode indentation commands use 2 spaces
opt.softtabstop = 2                                           -- insert mode tab and backspace use 2 spaces
opt.tabstop = 8                                               -- actual tabs occupy 8 characters
opt.wildignore = { 'log/**', 'node_modules/**', 'target/**', 'tmp/**', '*.rbc' }
opt.wildmode = { 'longest', 'list', 'full' }
opt.mouse = 'a'
opt.swapfile = false
opt.signcolumn = 'yes'                                        -- room for diagnostics and git signs
opt.completeopt = { 'menuone', 'noselect', 'popup' }
opt.statusline = [[[%n] %<%.99f %h%w%m%r%y %{FugitiveStatusline()}%=%-16( %l,%c-%v %)%P]]

if vim.fn.executable('rg') == 1 then
  opt.grepprg = 'rg --vimgrep --smart-case --hidden'
  opt.grepformat = '%f:%l:%c:%m'
end

-- keyboard shortcuts
local map = vim.keymap.set
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')
map('n', '<leader>l', ':w<CR>:! bundle exec rubocop -ax %<CR>')
map('n', '<leader>L', ':w<CR>:! bundle exec rubocop -a %<CR>')
map('n', '<leader>a', ':Rg<space>')
map('n', '<leader>b', ':Buffers<CR>')
map('n', '<leader>t', ':Files<CR>')
map('n', '<leader>d', ':NERDTreeToggle<CR>')
map('n', '<leader>f', ':NERDTreeFind<CR>')
map('n', '<leader><space>', ':StripTrailingWhitespace<CR>')
map('n', '<leader>g', ':Gitsigns toggle_signs<CR>')
map('n', '<leader>c', '<Plug>Kwbd')
map('n', '<leader>p', function() require('conform').format({ lsp_format = 'fallback' }) end)
map('n', '<leader>w', '<C-w><C-w>', { silent = true })
map('n', '<leader>ev', ':e $MYVIMRC<CR>', { silent = true })
map('n', '<leader>V', ':source $MYVIMRC<CR>:filetype detect<CR>:echo "init.lua reloaded"<CR>', { silent = true })
map('n', '<leader>rt', ':!ctags --extra=+f -R *<CR><CR>')
map('n', '<leader><leader>', '<C-^>')
map('n', 'cp', ':let @" = expand("%")<CR>')
vim.api.nvim_create_user_command('W', 'w', {})

-- autocommands
local autocmd = vim.api.nvim_create_autocmd
autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.fdoc', command = 'set filetype=yaml' })
-- automatically rebalance windows on vim resize
autocmd('VimResized', { command = 'wincmd =' })

-- LSP: neovim's built-in client stands in for syntastic. Servers come from
-- mason (see lua/plugins.lua); these mappings add to neovim's defaults
-- (K hover, grn rename, gra code action, grr references, gri implementation)
vim.diagnostic.config({ virtual_text = true })
autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    map('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
  end,
})

vim.cmd.colorscheme('vividchalk')

-- neovide (the GUI): font from the old macvim setup, and the usual cmd keys
if vim.g.neovide then
  opt.guifont = 'Monaco:h15'
  -- no sliding/trailing cursor, it jumps straight to where it's going
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  map('n', '<D-s>', ':w<CR>')
  map('v', '<D-c>', '"+y')
  map({ 'n', 'v' }, '<D-v>', '"+P')
  map({ 'i', 'c' }, '<D-v>', '<C-R>+')
  map('t', '<D-v>', [[<C-\><C-N>"+Pi]])
  map('n', '<D-a>', 'ggVG')
end
