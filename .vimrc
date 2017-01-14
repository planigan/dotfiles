set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

" list all plugins that you'd like to install here
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy find files with CTRL-P
Plugin 'jlanzarotta/bufexplorer' " buffers with <leader>be bt bs or bv
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'Xuyuanp/nerdtree-git-plugin' " git integration for nerdtree
Plugin 'airblade/vim-gitgutter' " ]c = next change, [c = previous change
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'lfilho/cosco.vim' " Adds ; at end of line with <leader>;
Plugin 'ervandew/supertab' " Makes tab work with autocomplete and ultrasnips
Plugin 'Shougo/deoplete.nvim' " async autocomplete with tern
Plugin 'ternjs/tern_for_vim', {'do': 'npm install'} " code intelligence for JS
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-syntastic/syntastic.git' " linting

" tmux pluggins
Plugin 'benmills/vimux'
"Plugin 'edkolev/tmuxline.vim'

" Several plugins to help work with Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-run-interactive'
Plugin 'tmux-plugins/vim-tmux' " tmux.conf syntax highlighting, commenting, K jumps to man page place for term, :make re sources, g! executes selection, g!! executes current line

Plugin 'tpope/vim-repeat' "allow plugins to utilize . command
Plugin 'tpope/vim-surround' " :help surround
Plugin 'tpope/vim-characterize' " press ga on a character give more info now 😊
Plugin 'vim-scripts/matchit.zip' " % also matches HTML tags / words / etc
Plugin 'jiangmiao/auto-pairs' " auto complete parens, quotes, brackets, etc.
Plugin 'vim-scripts/closetag.vim' " closes HTML tags with CTRL+_
Plugin 'scrooloose/nerdcommenter' " commenting/uncommenting
Plugin 'terryma/vim-multiple-cursors' " multiple cursors like in sublime
Plugin 'ConradIrwin/vim-bracketed-paste' " Automatically :set paste when pasting to avoid autoindent
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tommcdo/vim-exchange' " Use cx{motion command} on first swap, . to replace on the thing to swap with

Plugin 'pangloss/vim-javascript' " required by vim-jsx
Plugin 'mxw/vim-jsx' " react/jsx highlighting and formating

Plugin 'gko/vim-coloresque' " Colors in css files

Plugin 'mtth/scratch.vim'

Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Plugin 'ryanoasis/vim-devicons' " added icons to nerdtree, airline, ctrlp, etc
Plugin 'wincent/terminus' " modifies cursor based on mode. insert |, replace _, normal block
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on

let mapleader = " "

" Default sh syntax to bash
let g:is_bash=1
" setup invisible chars
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" vim-devicons settings
set encoding=utf-8
"set guifont=UbuntuMono\ Nerd\ Font\ 10
set guifont=InconsolataForPowerline\ Nerd\ Font\ 10

" Make aliases work with :! commands
let $BASH_ENV = "~/.bash_aliases"

"syntax enable
"try
  "colorscheme monokai
"catch
  "colorscheme elflord
"endtry
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:jsx_pragma_required = 0 " allow vim-jsx to run on .js files

set number
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set cursorline " highlight the line the cursor is on
set colorcolumn=80
set scrolloff=10 " start scrolling 10 lines from the bottom of the screen
"set autowrite " writes file when changing buffers
set hidden " supresses needing to use ! to switch buffers without a write

" solves sluggish feel associated with using space as leader
" and makes airline more responsive, also seems to make nerdtree
" more responsive to my mapping.
set timeoutlen=500 ttimeoutlen=0

" airline settings
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'simple'
let g:airline_theme = 'dark'
" disable updating tmuxline theme based on vim
let g:airline#extension#tmuxline#enabled = 0
":Tmuxline airline_visual
let g:tmuxline_theme = 'airline_visual'

" Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
"let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sh_checkers = ['shellcheck']

" From: https://github.com/vim-syntastic/syntastic/issues/1110#issuecomment-147960425
function! HasConfig(file, dir)
    return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js  let b:syntastic_checkers =
    \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \     ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Configure ultisnips
" From: https://github.com/SirVer/ultisnips/issues/376
" this gets tab working for both YouCompleteMe and Ultisnips, enter to insert
let g:UltiSnipsSnippetsDir=$HOME . '/.vim/UltiSnips/'
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" Tabular setup
if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif

" Gist setup
" Using Gist will copy URL to clipboard automatically
"let g:gist_clip_command = 'pbcopy' " Mac
let g:gist_clip_command = 'xclip -selection clipboard' " Linux copy
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_use_password_in_gitconfig = 0

" https://github.com/colbycheeze/dotfiles/blob/master/vimrc
" Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Mappings

" quick write and reload of settings
noremap <silent> <leader>so :w<cr> :so ~/.vimrc<cr>

" toggle invisible chars
nmap <silent> <leader>i :set invlist<cr>

" <leader>t for nerdtree
nnoremap <silent> <leader>t :NERDTreeToggle<cr> " Toggles the nerdtree file browser
let NERDTreeIgnore = ['node_modules']
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" set up <leader>; for cosco to add comma or semicolon to end of line
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" no more need to hit shift to start a command
nnoremap ; :
nnoremap <leader>; :!

" stop reaching for esc
inoremap jj <esc>

" copy to system clipboard
vnoremap <C-c> "+y<cr> " Ctrl-v to paste
vnoremap <C-C> "*y<cr> " middle click to paste

" Gnome-terminal sends escape for Alt, this fixes that
try
  execute "set <M-j>=\ej"
catch
endtry
nnoremap <M-j> j
inoremap <M-j> j
vnoremap <M-j> j
try
  execute "set <M-k>=\ek"
catch
endtry
nnoremap <M-k> k
inoremap <M-k> k
vnoremap <M-k> k
" move line or visually selected blocks of lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" movement maps
noremap J 5j
noremap K 5k

" move between windows
map <silent> <leader>h :wincmd h<cr>
map <silent> <leader>j :wincmd j<cr>
map <silent> <leader>k :wincmd k<cr>
map <silent> <leader>l :wincmd l<cr>

" Allow moving around between Tmux windows
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
"
"Open a tmux pane with Node
nnoremap <leader>node :VtrOpenRunner {'orientation': 'v', 'percentage': 20, 'cmd': 'node'}<cr>
nnoremap <leader>nodeh :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'node'}<cr>

