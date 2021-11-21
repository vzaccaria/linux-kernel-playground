let g:mapleader = ","
set nocompatible

set ignorecase
set expandtab

" use system clipboard
set clipboard+=unnamedplus

" Add to .vimrc to enable project-specific vimrc

set exrc
set secure

" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

call plug#begin() 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'alx741/vim-hindent'
Plug 'jceb/vim-orgmode'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'NLKNguyen/papercolor-theme'

" +         to enlarge the visual selection
" _         to shrink it 
" gp        to refill the paragraph
Plug 'terryma/vim-expand-region'

" ysiw]     put square parentheses around iw text object
" cs"'      change surrounding quotes from " to '
" ds{       delete surrounding {
" S"        in visual mode, put quotes around selected text
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'

" gc        visual mode to comment out the selection, and 
" gcc       comment out a line (takes a count), 
" gc        comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc        operator pending mode to target a comment.
Plug 'tpope/vim-commentary'

Plug 'easymotion/vim-easymotion'

" gt        to set title case
" gT        to set title case whole line
Plug 'christoomey/vim-titlecase'

" C-n       multiple times then c, I, A, d
Plug 'terryma/vim-multiple-cursors'


call plug#end()

colorscheme industry

" custom setting for clangformat
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'asm': ['gcc'],
\   'cpp': ['clang-format'],
\}

let g:ale_fix_on_save = 1


