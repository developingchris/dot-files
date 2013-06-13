#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/scrooloose/nerdcommenter.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/plasticboy/vim-markdown.git",
"git://github.com/kien/ctrlp.vim.git",
  #"git://git.wincent.com/command-t.git",
  # "git://github.com/msanders/snipmate.vim.git",
  # "git://github.com/astashov/vim-ruby-debugger.git",
  # "git://github.com/timcharper/textile.vim.git",
  # "git://github.com/tpope/vim-git.git",
  # "git://github.com/tpope/vim-haml.git",
  # "git://github.com/tpope/vim-repeat.git",
  # "git://github.com/tpope/vim-surround.git",
  # "git://github.com/tsaleh/vim-align.git",
  # "git://github.com/tsaleh/vim-shoulda.git",
  # "git://github.com/tsaleh/vim-supertab.git",
  # "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/groenewege/vim-less.git",
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")
FileUtils.cd(bundles_dir)
puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end
