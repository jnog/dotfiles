"""" Plugins
"" vim-plug install 
"" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
""     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"" Go
Plug 'fatih/vim-go'

"" JS/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

call plug#end()

"""" Configs
:syntax on
:set number
:colorscheme molokai

" On pressing tab, insert 2 spaces
:set tabstop=2
:set expandtab

"" fzf
:inoremap <c-p> <Esc>:Files<CR>

"" vim-indent-guides 
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

"" NerdTree
" open NerdTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
" default focus to second window if file passed
:au VimEnter * if argc() > 0 | wincmd l | endif
" close NerdTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:inoremap <c-o> <Esc>:NERDTreeToggle<CR>

"" Go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

"" JS
" ale linting
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_fixers = {
\	'*': ['trim_whitespace'],
\	'javascript': ['prettier', 'eslint'],
\ }
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

"" JSON

autocmd BufWritePost *.json silent! execute ':%!python -m json.tool' | w
:command JsonFmt :%!python -m json.tool
