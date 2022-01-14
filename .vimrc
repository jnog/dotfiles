"""" Plugins

"" vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'

"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_version_warning = 0

"" JS/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"""" Configs
syntax on
set number
set spell
colorscheme spacegray
let loaded_matchparen = 1
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start

"" ale
" close loclist window when buffer is closed
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

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

"" JS
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0


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
