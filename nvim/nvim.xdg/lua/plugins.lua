return {
  -- carried over from the vimrc, these all work fine in neovim
  'bogado/file-line',
  'rhysd/clever-f.vim',
  'tpope/vim-bundler',
  'tpope/vim-commentary',
  'tpope/vim-endwise',
  'tpope/vim-fugitive',
  'tpope/vim-ragtag',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'vim-ruby/vim-ruby',
  'vim-scripts/kwbdi.vim',
  'axelf4/vim-strip-trailing-whitespace',
  { 'tpope/vim-vividchalk', lazy = false, priority = 1000 },
  { 'folke/tokyonight.nvim', lazy = true },
  { 'rizzatti/dash.vim', cmd = { 'Dash', 'DashKeywords' } },
  { 'scrooloose/nerdtree', cmd = { 'NERDTreeToggle', 'NERDTreeFind' },
    init = function() vim.g.NERDSpaceDelims = 1 end },

  -- language syntax that neovim doesn't ship
  { 'groenewege/vim-less', ft = 'less' },
  { 'kchmck/vim-coffee-script', ft = 'coffee' },
  { 'jwalton512/vim-blade', ft = 'blade' },
  'tpope/vim-cucumber',

  -- rails.vim dropped Rnavcommand, projections give the same :Edecorator etc.
  { 'tpope/vim-rails', init = function()
    vim.g.rails_projections = {
      ['app/decorators/*_decorator.rb'] = { command = 'decorator' },
      ['app/observers/*_observer.rb'] = { command = 'observer' },
      ['features/*.feature'] = { command = 'feature' },
      ['app/jobs/*_job.rb'] = { command = 'job' },
      ['app/mediators/*_mediator.rb'] = { command = 'mediator' },
      ['features/step_definitions/*_steps.rb'] = { command = 'stepdefinition' },
    }
  end },

  -- fzf.vim replaces both ctrlp and ack (:Files, :Buffers, :Rg)
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },

  -- replaces the gitgutter toggle that was mapped but never installed
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- replaces vim-prettier, run with <leader>p
  { 'stevearc/conform.nvim', opts = {
    formatters_by_ft = {
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      css = { 'prettier' },
      less = { 'prettier' },
      json = { 'prettier' },
      ruby = { 'rubocop' },
    },
  } },

  -- language servers, replaces syntastic. :Mason to browse/add more
  { 'mason-org/mason-lspconfig.nvim',
    dependencies = { { 'mason-org/mason.nvim', opts = {} }, 'neovim/nvim-lspconfig' },
    opts = { ensure_installed = { 'ruby_lsp', 'ts_ls' } } },
}
