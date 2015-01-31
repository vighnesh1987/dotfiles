" --------------- Vundle -------------------------------------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'YankRing.vim'
Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ------------ Vundle ----------------------------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

"---------------------------------------------------------------------
"   			Plugin configuration
"---------------------------------------------------------------------

"""" Syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""

"""" vim-indent-guides
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1
""""

"""" ctrl-p
let g:ctrlp_map = '<c-p>'
nnoremap <C-p> :CtrlP<CR>


"---------------------------------------------------------------------
"   			Favorite mappings
"---------------------------------------------------------------------

"""" Visual shifting
vnoremap < <gv
vnoremap > >gv
""""

" Remap leader key
:map ' <C-w>

"""" Necessary reverse mappings
" J
:nnoremap K i<CR><Esc> 
" gt
:map gr :tabp<CR>
""""

" Search and replace using current word
:map <Leader>rr "hy:%s/<C-r>h//gc<left><left><left>

:map <leader>v :vsplit<cr>
:map <Leader>nn :set nonu<CR>

"""" Highlight current line and column
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>hc :set cursorline! cursorcolumn!<CR>
""""

" Delete current file
:map <Leader>remove :call delete(expand('%'))

"""" Function Keys
" <F1> - opens up help in split window
:map <F2> :%s/\t/  /gc<CR>
:map <F3> :noh<CR>
" <F4> - toggle paste
" <F5> :GundoShow
" <F6>
" Syntax highlighting toggle
:map <F7> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>
" <F8>
" <F9>
:map <F10> :YRShow<CR>
"System uses <F11>, <F12> - show desktop, etc
""""


"---------------------------------------------------------------------
"   			Aesthetic settings
"---------------------------------------------------------------------
colorscheme jellybeans
set tabstop=2 shiftwidth=2 expandtab
