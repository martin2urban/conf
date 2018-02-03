set nocompatible  " be iMproved, required
filetype off  " required
set exrc


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" ==== helpers
Plugin 'vim-scripts/L9'

" ==== File tree
Plugin 'scrooloose/nerdtree'

" ==== Completion
Plugin 'Valloric/YouCompleteMe'

" ==== Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'mitsuhiko/vim-jinja'

" ==== moving / seraching
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'

" ==== snippets
Plugin 'SirVer/ultisnips'

" ==== AUTOCOMPLETE PAIRS
Plugin 'jiangmiao/auto-pairs'

" ==== PLUGIN THEMES
"Plugin 'morhetz/gruvbox'
Plugin 'crusoexia/vim-monokai'

"==== Javascript IDE====
Plugin 'pangloss/vim-javascript'
"==== vim tmux integration===
Plugin 'christoomey/vim-tmux-navigator'
"=== running specs from vim, sent to tmux via Tslime
"https://robots.thoughtbot.com/running-specs-from-vim-sent-to-tmux-via-tslime

Plugin 'jgdavey/tslime.vim'



call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
"colorscheme gruvbox
colorscheme monokai
set guifont=Monospace\ 18
set fillchars+=vert:\$
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999

" ==== NERDTREE
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" === Javascript syntax highlight ===
let g:javascript_plugin_jsdoc = 1



" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
let g:UltiSnipsExpandTrigger="<A-ENTER>"
let g:UltiSnipsJumpForwardTrigger="<A-ENTER>"
let g:UltiSnipsJumpBackwardTrigger="<A-BACKSPACE>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== custom commands
command Jsonfix execute ":%!python -m json.tool"
set secure


" === Powerline
set rtp+=/usr/share/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" === From MU _vimrc
let mapleader = ","
nmap <leader>nt :NERDTree<cr>

"===MU execute perl from vim
map <leader>p :w<cr>:!perl %<cr>
"map <leader>p :w<cr>:!tmux run-shell -t 2 "perl %"<cr>
imap <C-p> <ESC> :w<cr>:!perl %<cr>




"===autofold save
"https://til.hashrocket.com/posts/17c44eda91-persistent-folds-between-vim-sessions
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END




