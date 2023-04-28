"""" Plugins

"" vim-plug install
if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	 endif
 else
	if empty(glob('~/.vim/autoload/plug.vim'))
		  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
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

"" Fugitive
Plug 'tpope/vim-fugitive'

"" Github Copilot
Plug 'github/copilot.vim'

"" GraphQL
Plug 'jparise/vim-graphql'

"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"" JS/JSX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"" Prettier
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install --frozen-lockfile --production' }

"" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

"""" Configs
syntax on
set mouse=a
set number
set spell
colorscheme molokai
let loaded_matchparen = 1
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
autocmd Filetype gitcommit setlocal spell textwidth=72

"" ale
" close localist window when buffer is closed
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

"" JS
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"" Go
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_version_warning = 0

"" Rust
let g:rustfmt_autosave = 1

" ale linting
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚠️'
let g:ale_statusline_format = ['🚨 %d', '⚠️ %d', '']
let g:ale_linters = {
\ 'javascript': ['stylelint', 'eslint'],
\ 'typescript': ['stylelint', 'eslint', 'tsserver'],
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
\ 'javascriptreact': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'typescriptreact': ['prettier', 'eslint'],
\ 'go': ['goimports'],
\ 'ruby': ['rubocop'],
\ 'yaml': ['prettier'],
\ 'markdown': ['prettier'],
\ 'graphql': ['prettier'],
\ }
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

"" JSON formatter
:command JsonFmt :%!python -m json.tool
