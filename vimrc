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

"-- general editing
Plugin 'keepcase.vim'                           " :SubstituteCase
Plugin 'YankRing.vim'                           " :YRShow
Plugin 'matchit.zip'                            " Improve %
Plugin 'nathanaelkane/vim-indent-guides'        " Visual indicator for indentation
Plugin 'tsaleh/vim-align'                       " TODO
Plugin 'ctrlpvim/ctrlp.vim'                     " <C-p> opens fuzzy file finder
Plugin 'AutoComplPop'                           " Opens up pop-up window with Vim's omnicomplete suggestions 
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'               " <leader>c<space> to toggle comments
Plugin 'scrooloose/syntastic'                   " :Errors
Plugin 'mileszs/ack.vim'

"-- helpful panes
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'                " :NERDTreeTabsToggle
Plugin 'majutsushi/tagbar'                      " :TagbarToggle

"-- integrations
Plugin 'tpope/vim-fugitive'                     " :Gblame
Plugin 'tpope/vim-eunuch'                       " :Remove, :Chmod, :SudoWrite

"-- programming language support
Plugin 'kchmck/vim-coffee-script'               " coffeescript
Plugin 'digitaltoad/vim-jade'                   " jade
Plugin 'tpope/vim-haml'                         " haml
Plugin 'vim-ruby/vim-ruby'                      " ruby
Plugin 'zhubert/vim-ruby-fmt'                   " rubyfmt
Plugin 'tpope/vim-rails'                        " rails
Plugin 'othree/xml.vim'                         " xml
Plugin 'fatih/vim-go'                           " golang
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'solarnz/thrift.vim'
Plugin 'rust-lang/rust.vim'                     " rust


"-- color schemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'

"-- TODO
Plugin 'terryma/vim-multiple-cursors'           " TODO
Plugin 'editorconfig/editorconfig-vim'          " TODO

Plugin 'L9'

"===== src: Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

"===== src: git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ------------ Vundle ----------------------------------------------------------------------------------------------------------------

"---------------------------------------------------------------------
"         Plugin configuration
"---------------------------------------------------------------------

"""" Syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Ignore cucumber files because of annoying 'Command terminated' error
let g:syntastic_ignore_files = ['.*feature']
""""

"""" vim-indent-guides
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup=1
""""

"""" YankRing
" Remove potential clash with CtrlP
let g:yankring_replace_n_pkey=""
""""

"""" CtrlP
let g:ctrlp_map = '<c-p>'
nnoremap <C-p> :CtrlP<CR>
" Ignore certain folders
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'
""""

"""" Powerline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
""""

"""" vim-go
let g:go_doc_keywordprg_enabled = 0 " Disable mapping for 'K'
""""

"""" vim-markdown
let g:vim_markdown_folding_disabled=1
""""

"""" vim-ruby-fmt
"autocmd FileType ruby autocmd BufWritePost <buffer> Fmt
"nmap ff :Fmt<CR>
""""
"---------------------------------------------------------------------
"         Favorite mappings
"---------------------------------------------------------------------

" Map leader key
let mapleader=","

"""" Visual shifting
vnoremap < <gv
vnoremap > >gv
""""

" Vim viewports
map ' <C-w>

"""" Necessary reverse mappings
" J
nnoremap K i<CR><Esc> 
" gt
map gr :tabp<CR>
""""

" Search and replace using current word
map <Leader>rr "hy:%s/\<<C-r>h\>//gc<left><left><left>

" Ack search current word
map <Leader>ack "hy:Ack <C-r>h

map <leader>h :split<cr>
map <leader>v :vsplit<cr>
map <Leader>nn :set nonu<CR>

"""" Highlight current line and column
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>hc :set cursorline! cursorcolumn!<CR>
""""

"""" Function Keys
" <F1> - opens up help in split window
map <F2> :NERDTreeTabsToggle<CR>
map <F3> :noh<CR>

" Pressing F4 in normal mode will invert the 'paste' option, and will then show the value of that option
nnoremap <F4> :set invpaste paste?<CR>
" Press F4 when in insert mode to toggle paste
set pastetoggle=<F4>
" Show whether paste is turned on in insert mode
set showmode
" <F5> :GundoShow
" <F6>
" Syntax highlighting toggle
map <F7> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>
" Toggle Syntastic mode between automatic and manual
map <F8> :SyntasticToggleMode<CR>
" <F9>
map <F10> :YRShow<CR>
"System uses <F11>, <F12> - show desktop, etc
""""


"---------------------------------------------------------------------
"         Aesthetic settings
"---------------------------------------------------------------------
syntax on             " Enable syntax highlighting
set number            " Enable line numbers

colorscheme jellybeans
set tabstop=2 shiftwidth=2 expandtab

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

set laststatus=2
set statusline+=%F

"command FormatJSON %!python -m json.tool

" strikethrough
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

