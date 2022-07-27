  " A more configured vimrc, for a better experience
  
  " fixes the background 
  :set background=dark
  colorscheme solarized
  "let g:solarized_termcolors=256
  
  " enable syntax highlighting
  :syntax on
  
  " turns on hybrid line numbering
  :set number relativenumber
  
  " converts all tab characters to spaces, use :retab to replace all tab characters in active buffer
  :set tabstop=4 shiftwidth=4 expandtab
  
  " Removes annoying bells
  :set noerrorbells
  :set novisualbell
 
  :set noswapfile

  " insure modelines are disabled, they're a security hazard. 
  :set nomodeline

  " ignore case when searching
  :set ignorecase
  
  " my preferred default (always available) color scheme
  ":colorscheme evening
  
  " smartindenting
  :set autoindent smartindent
  
  " remap & to :&&, easier & better repeating of search & replacements
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>

  " fix stupid python indenting bug
  inoremap # X#

  " sets compatibility for plugins
  set nocompatible
  filetype plugin on
  let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

  " enable fzf compatibility with vim
  set rtp+=~/.fzf

  command! Diary VimwikiDiaryIndex
  augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
   augroup end



" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
