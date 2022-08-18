"let g:ycm_global_ycm_extra_conf = '~/ycm_extra/.ycm_extra_conf.py'

let g:livedown_autorun = 1
let g:livedown_open = 1

"{{{ Plugins

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
"Plug 'jaxbot/browserlink.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'marijnh/tern_for_vim'
Plug 'tomtom/tlib_vim'
Plug 'epeli/slimux'
Plug 'wincent/terminus'
Plug 'chrisbra/Colorizer'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'gyim/vim-boxdraw'
" Plug 'ambv/black'
" Plug 'psf/black', { 'tag': '19.10b0' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go'
" Plug 'jparise/vim-graphql'
" Plug 'brooth/far.vim'
" Plug 'racer-rust/vim-racer'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pantharshit00/vim-prisma'

" " Install nightly build, replace ./install.sh with install.cmd on windows
" Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" " Or install latest release tag
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" " Or build from source code
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'

let g:deoplete#enable_at_startup = 0

" Themes
Plug 'chriskempson/tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'othree/html5.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'raphamorim/lucario'
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'honza/vim-snippets'

" Syntax highlighting
"Plug 'guns/vim-clojure-static'
" Plug 'kchmck/vim-coffee-script'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'digitaltoad/vim-jade'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
"Plug 'cachance7/wmgraphviz.vim'
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'lambdatoast/elm.vim'
"Plug 'ekalinin/Dockerfile.vim'
Plug 'davidhalter/jedi-vim'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'sheerun/vim-polyglot'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
" Plug 'https://bitbucket.org/larsyencken/vim-drake-syntax.git'
Plug 'leafgarland/typescript-vim'

Plug 'Lokaltog/vim-distinguished'
Plug 'junegunn/vim-easy-align'

" Various tpope plugins
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-speeddating'

Plug 'vim-scripts/utl.vim'
Plug 'w0ng/vim-hybrid'
Plug 'andrewstuart/vim-kubernetes'
" Plug 'shime/vim-livedown'

" Plug 'lukaszkorecki/CoffeeTags'
"Plug 'majutsushi/tagbar'

"Plug 'shime/vim-livedown'

"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'


Plug 'ryanoasis/vim-devicons'
Plug 'moll/vim-bbye'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Plug 'jceb/vim-orgmode'

Plug 'freitass/todo.txt-vim'

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-orgmode/orgmode'
endif

" Initialize plugin system
call plug#end()

"}}}

"{{{Auto Commands

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" autocmd BufWrite *.svelte,*.js if ! &bin | silent! execute 'Prettier' | endif
" autocmd BufWrite *.py if ! &bin | silent! execute '%!isort -' | silent! execute '%!docformatter -' | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

let g:black_virtualenv = '/usr/local/bin/'

"autocmd BufWrite *.py :Black
" autocmd BufRead *.svelte set ft=html
" autocmd BufRead *.tsx set ft=typescriptreact
autocmd BufRead *.svelte set syntax=typescriptreact

"}}}

"{{{Misc Settings
set shell=bash

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Allow visual block to go past last char
set virtualedit=block

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
set tabstop=2
"set softtabstop=3

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
"compiler gcc " Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

"nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
"let g:clipbrdDefaultReg = '+'

set hidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"{{{Look and Feel

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   let g:base16_shell_path='~/.config/base16-shell/scripts'
"   source ~/.vimrc_background
" endif

"Status line gnarliness
set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Number of Lines & Columns
"set lines=40 columns=120
set guioptions-=m  "remove menu bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" }}}

"{{{ Functions
let monocle = 0
function! ToggleMonocleSplit()
   if g:monocle == 0
      call feedkeys("\<C-W>_")
      call feedkeys("\<C-W>|")
      "exec <c-w>_
      "exec <c-w>|
      let g:monocle = 1 "monocle mode is ON
   else
      call feedkeys("\<C-W>=")
      let g:monocle = 0 "monocle mode is OFF
   endif
endfunction

function! SplitMovement(direction)
   let aftermove = ""
   let move = ""
   "if g:monocle == 1
   "   let aftermove = "\<C-W>_\<C-W>|"
   "endif
   let move = "\<C-W>".a:direction
   call feedkeys(move.aftermove)
endfunction

function! SimpleNodeShowModule()
  let l:module = expand('<cword>')
  if l:module == '' || l:module == 'var'
    return
  endif

  call feedkeys("/".l:module."/\<CR>", 'x')
  call feedkeys("ggNn", 'x')
  call feedkeys("^f'gf", "x")
endfunction

" Uses vim-node to open the definition of the module under the cursor
function! NodeShowModule()
  if exists('g:nsm_buf') == 0
    let g:nsm_buf = -1
  endif

  if exists('g:nsm_win') == 0
    let g:nsm_win = -1
  endif

  " Grab the word under the cursor -- that's the one we're going to look for
  let l:module = expand('<cword>')

  if l:module == '' || l:module == 'var'
    return
  endif

  " Gonna be a bumpy ride, save where the cursor started
  let l:cur_pos = getpos('.')

  let v:errmsg=''

  " If we called this in the opened window, reuse the window
  "if g:nsm_buf != -1 && bufnr('%') == g:nsm_buf
  if winnr() == g:nsm_win
    " Use this madness to find the first occurrence of the word because there
    " are awful corner cases with all of the other ways
    call feedkeys("/".l:module."/\<CR>", 'x')
    call feedkeys("ggNn", 'x')

    let l:buf_name_pre = expand('%')
    call feedkeys("^f'gf", "x")
    redraw
    let l:buf_name_post = expand('%')

    if l:buf_name_pre != l:buf_name_post
      let g:nsm_buf = bufnr('%')
    endif
    return
  endif

  " Find where the module was required
  silent! execute 'ij '.l:module

  " Trickiness if we stay on the same line
  let l:did_jump = 1
  if v:errmsg == 'E387: Match is on current line'
    let l:did_jump = 0
  endif

  " If module buffer is currently open, close it
  let l:nsm_window = bufwinnr(g:nsm_buf)
  if l:nsm_window != -1
    silent! execute l:nsm_window.'wincmd c'
  endif

  " Maybe open a new module window
  let l:win_count_pre = winnr('$')
  call feedkeys("^f'\<C-w>f", "x")
  redraw
  let l:win_count_post = winnr('$')

  " If the window opened then current buffer is the module buffer
  if l:win_count_post != l:win_count_pre
    let g:nsm_buf = bufnr('%')
    let g:nsm_win = winnr()
  else
    " If we previously had the module buffer open, reopen it
    if l:nsm_window != -1
      silent! execute g:nsm_buf.'wincmd ^'
    endif
  endif

  wincmd p

  " After all of that moving around, try to get back to where we started
  if l:did_jump == 1
    call feedkeys("\<C-o>")
  else
    " Restore the cursor position
    call setpos('.', l:cur_pos)
    " Hack to preserve the column position if next movement happens to be a line
    call feedkeys('````')
  endif
endfunction

" nnoremap <silent> <C-g> :call SimpleNodeShowModule()<CR>

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction

"}}}

"{{{ Paste Toggle
"let paste_mode = 0 " 0 = normal, 1 = paste
"
"func! Paste_on_off()
"   if g:paste_mode == 0
"      set paste
"      let g:paste_mode = 1
"   else
"      set nopaste
"      let g:paste_mode = 0
"   endif
"   return
"endfunc
"}}}

"{{{ Todo List Mode

function! TodoListMode()
   e ~/.todo.otl
   Calendar
   wincmd l
   set foldlevel=1
   tabnew ~/.notes.txt
   tabfirst
   " or 'norm! zMzr'
endfunction

"}}}

"}}}

"{{{ Mappings

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()<CR>

" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>

" Open the Project Plugin
nnoremap <silent> <Leader>pal  :Project .vimproject<CR>

" TODO Mode
nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Split movement
nnoremap <silent> <C-J> :call SplitMovement("j")<CR>
nnoremap <silent> <C-K> :call SplitMovement("k")<CR>
nnoremap <silent> <C-L> :call SplitMovement("l")<CR>
nnoremap <silent> <C-H> :call SplitMovement("h")<CR>

" Monocle mode for splits
nnoremap <silent> <C-Space> :execute ToggleMonocleSplit()<CR>

"nnoremap  <C-l> :tabn<CR>
"nnoremap  <C-h> :tabp<CR>

" Next Tab
"nnoremap <silent> <C-Right> :tabnext<CR>
"nnoremap <silent> <C-[> :tabnext<CR>
"
"" Previous Tab
"nnoremap <silent> <C-Left> :tabprevious<CR>
"nnoremap <silent> <C-]> :tabprevious<CR>

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
"nnoremap <silent> <C-t> :tabnew<CR>

" DOS is for fools.
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Edit gvimrc \gv
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <silent> J <PageDown>M
nnoremap <silent> K <PageUp>M

vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"map <C-L> <C-W>l<C-W>_
"map <C-H> <C-W>h<C-W>_

" Good call Benjie (r for i) nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
" nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Testing
set completeopt=longest,menuone,preview

" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
" inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Simulate some Visual Studio conveniences
" Backward word delete
inoremap <c-backspace> <c-w>

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

let NERDTreeIgnore = ['\.pyc', '__pycache__', 'tags$']

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Fix email paragraphs
nnoremap <leader>par :%s/^>$//<CR>

" EasyMotion leader
let g:EasyMotion_leader_key = ':'
nmap s :w
nmap S :b


" Powerline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':w'

"ly$O#{{{ "lpjjj_%A#}}}jjzajj

"}}}

"{{{Taglist configuration
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}

"{{{Tagbar config
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"}}}

" {{{ HTML5 support
"let g:html5_event_handler_attributes_complete = 0
"let g:html5_rdfa_attributes_complete = 0
"let g:html5_microdata_attributes_complete = 0
"let g:html5_aria_attributes_complete = 0
" }}}

" {{{ Tagbar settings
noremap <silent> <C-t> :TagbarToggle<CR>
"let g:CoffeeAutoTagDisabled=0     " Disables autotaging on save (Default: 0 [false])
"let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
" let g:CoffeeAutoTagIncludeVars=1         " Includes variables (Default: 0 [false])
"let g:CoffeeAutoTagTagRelative=<0 or 1>  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" }}}

" {{{ FZF ctrl-p
noremap <Tab> :Ag<CR>
noremap <C-o> :Tags<CR>
noremap <C-u> :Buf<CR>
noremap <C-p> :Files<CR>
" }}}

" {{{ Slimux bindings
noremap <Leader>s :SlimuxREPLSendLine<CR>
vnoremap <Leader>s :SlimuxREPLSendSelection<CR>
"noremap  <C-i> :SlimuxREPLSendLine<CR>
"vnoremap <C-i> :SlimuxREPLSendSelection<CR>
noremap <Leader>b :SlimuxREPLSendBuffer<CR>
noremap <Leader>a :SlimuxShellLast<CR>
noremap <Leader>k :SlimuxSendKeysLast<CR>
" }}}

" {{{ Coffeescript bindings
" noremap <Leader>cc :CoffeeCompile vert<CR>
" }}}

" {{{ Syntastic settings
let g:syntastic_auto_jump      = 0
let g:syntastic_auto_loc_list  = 0
let g:syntastic_check_on_open  = 1
let g:syntastic_enable_signs   = 1
let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = {
            \ 'mode' : 'active',
            \ 'passive_filetypes' : ['go']
            \ }
let g:syntastic_html_tidy_ignore_errors = [
            \ 'trimming empty <i>',
            \ 'trimming empty <span>',
            \ '<input> proprietary attribute \"autocomplete\"',
            \ 'proprietary attribute \"role\"',
            \ 'proprietary attribute \"hidden\"',
            \ 'proprietary attribute \"ng-',
            \ '<svg> is not recognized!',
            \ 'discarding unexpected <svg>',
            \ 'discarding unexpected </svg>',
            \ '<rect> is not recognized!',
            \ 'discarding unexpected <rect>',
            \ '<circle> is not recognized!',
            \ 'discarding unexpected <circle>',
            \ 'discarding unexpected </circle>'
            \ ]
let g:syntastic_js_jshint_args = ['--config ~/.jshintrc']
" }}}

" ale options
" let python-mode handle the py files
let g:ale_pattern_options = {
\   '.*\.py$': {'ale_enabled': 0},
\   '.*\.html$': {'ale_enabled': 0},
\   '.*\.ts$': {'ale_enabled': 0},
\   '.*\.php$': {'ale_linters': ['phpcs'], 'ale_php_phpcs_standard': 'WordPressVIPMinimum'},
\}


let g:UltiSnipsExpandTrigger="<C-j>"

au BufNewFile,BufRead *.ejs set filetype=html

set fillchars+=stl:\ ,stlnc:\

let g:screen_size_restore_pos = 1
let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#documentation_command = ''
let jedi#use_environment = 'python3'
let g:jedi#smart_auto_mappings = 0


" python-mode
let g:pymode_doc_bind = '?'
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0

let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_select = ["C,E,F,W,B,B950"]
let g:pymode_lint_ignore = ["E501", "W503",]
"let g:pymode_lint_options_pep8 = {
"  \   'select': 'C,E,F,W,B,B950',
"  \   'ignore': 'E501',
"  \   'max_line_length': 88
"  \ }


" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1

" Don't mess with mah 'K' binding!
let g:go_doc_keywordprg_enabled = 0

" YCM options
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'go' : ['.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Git Gist
let g:gist_post_private = 1

set foldmethod=syntax
set foldlevelstart=99
set omnifunc=syntaxcomplete#Complete
set encoding=UTF-8
set guifont=Hasklig\ Medium:h12
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CocConfig Start
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr><C-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <silent><expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : coc#refresh()


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

nmap Y yy

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Docformat mark ` | silent! execute '%!isort -' | silent! execute '%!docformatter -' | normal ``
command! -nargs=0 Format silent! :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

noremap <space> :Format<cr>

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:coc_filetype_map = {
      \ 'html': 'javascript',
      \}


" Using CocList
" Show all diagnostics

" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
call coc#config('python', {'pythonPath': $PYENV_VIRTUAL_ENV})
" CocConfig End

" Without these, we don't get nice colors in cool colorschemes like 'one'
" (some colors will be ok, but background will be black)
" https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colorscheme gruvbox
colorscheme one
set background=dark
" set background=light
let g:airline_theme='one'
let g:lightline_theme='one'


" vim-go options
let g:go_def_mode='godef'
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_enabled=["deadcode", "errcheck", "gosimple", "govet", "ineffassign", "staticcheck", "structcheck", "typecheck", "unused", "varcheck"]
" noremap <silent> gt :GoInfo<cr>
" noremap <silent> gi :GoImplements<cr>
autocmd BufRead /Users/casey/go/src/*.go exe 'silent :GoGuruScope bitbucket.org/sentimens/...'

      " \  let s:tmp = matchlist(expand('%:p'),
      "     \ '/Users/casey/go/src/\(bitbucket.org/sentimens/[^/]\+\)')
      " \| if len(s:tmp) > 1 |  exe 'silent :GoGuruScope ' . s:tmp[1] . '/...' | endif
      " \| unlet s:tmp


" vim-orgmode
let g:org_agenda_files=['~/org/index.org']
let g:utl_cfg_hdl_scm_http_system = "silent! open '%u'"
let g:utl_cfg_hdl_scm_http = g:utl_cfg_hdl_scm_http_system

" tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:rustfmt_command = 'rustfmt'
"let g:rustfmt_autosave = 1

let mapleader = ','

filetype plugin indent on
syntax on
set rtp+=/usr/local/opt/fzf
