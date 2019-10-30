"""" Plugins
"" vim-plug install
"" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
""     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'beautify-web/js-beautify'
Plug 'rizzatti/dash.vim'

"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_version_warning = 0

"" JS/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

call plug#end()

"""" Configs
:syntax on
:set number
:set spell
:colorscheme monokai
:let loaded_matchparen = 1

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
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
" default focus to second window if file passed
:au VimEnter * if argc() > 0 | wincmd l | endif
" close NerdTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:inoremap <c-o> <Esc>:NERDTreeToggle<CR>

"" Go
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ale linting
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_linters = {
\ 'jsx': ['stylelint', 'eslint'],
\ 'javascript': ['stylelint', 'eslint'],
\ 'go': ['gometalinter', 'goimport'],
\ 'ruby': ['rubocop', 'brakeman'],
\ 'graphql': ['eslint'],
\ }
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 3
let g:ale_fixers = {
\	'*': ['trim_whitespace'],
\ 'json': ['prettier'],
\	'javascript': ['prettier', 'eslint'],
\ 'jsx': ['prettier', 'eslint'],
\ 'go': ['goimports'],
\ 'yaml': ['prettier'],
\ 'graphql': ['prettier'],
\ }
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

"" JSON formatter
:command JsonFmt :%!python -m json.tool
