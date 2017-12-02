"let g:ycm_global_ycm_extra_conf = '~/ycm_extra/.ycm_extra_conf.py'

let g:livedown_autorun = 1
let g:livedown_open = 1

"{{{ Plugins

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'jaxbot/browserlink.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'marijnh/tern_for_vim'
Plug 'tomtom/tlib_vim'
Plug 'epeli/slimux'
Plug 'wincent/terminus'
Plug 'chrisbra/Colorizer'

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
"Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'honza/vim-snippets'

" Syntax highlighting
"Plug 'fatih/vim-go'
"Plug 'guns/vim-clojure-static'
"Plug 'kchmck/vim-coffee-script'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'digitaltoad/vim-jade'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
"Plug 'cachance7/wmgraphviz.vim'
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'lambdatoast/elm.vim'
"Plug 'ekalinin/Dockerfile.vim'
Plug 'sheerun/vim-polyglot'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node'

Plug 'Lokaltog/vim-distinguished'
Plug 'junegunn/vim-easy-align'

" Various tpope plugins
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'w0ng/vim-hybrid'
Plug 'andrewstuart/vim-kubernetes'
Plug 'shime/vim-livedown'

Plug 'lukaszkorecki/CoffeeTags'
Plug 'majutsushi/tagbar'

Plug 'shime/vim-livedown'

"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

"}}}

"{{{Auto Commands

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

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

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"{{{Look and Feel

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  let g:base16_shell_path='~/.config/base16-shell/scripts'
  source ~/.vimrc_background
endif

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

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

nnoremap <silent> <C-g> :call SimpleNodeShowModule()<CR>

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction

"}}}

"{{{Theme Rotating
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      let colorstring = "inkpot#ron#blue#elflord#evening#koehler#murphy#pablo#desert#torte#"
      let x = match( colorstring, "#", g:themeindex )
      let y = match( colorstring, "#", x + 1 )
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring, x + 1, y - x - 1)
         return ":colorscheme ".themestring
      endif
   endwhile
endfunction
" }}}

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

" Rotate Color Scheme <F8>
nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

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
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Testing
set completeopt=longest,menuone,preview

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Simulate some Visual Studio conveniences
" Backward word delete
inoremap <c-backspace> <c-w>

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

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
let g:CoffeeAutoTagIncludeVars=1         " Includes variables (Default: 0 [false])
"let g:CoffeeAutoTagTagRelative=<0 or 1>  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" }}}

" {{{ FZF ctrl-p
noremap <C-p> :Ag<CR>
noremap <C-o> :Tags<CR>
noremap <C-u> :Buf<CR>
" }}}

" {{{ Slimux bindings
noremap <Leader>s :SlimuxREPLSendLine<CR>
vnoremap <Leader>s :SlimuxREPLSendSelection<CR>
noremap  <C-i> :SlimuxREPLSendLine<CR>
vnoremap <C-i> :SlimuxREPLSendSelection<CR>
noremap <Leader>b :SlimuxREPLSendBuffer<CR>
noremap <Leader>a :SlimuxShellLast<CR>
noremap <Leader>k :SlimuxSendKeysLast<CR>
" }}}

" {{{ Coffeescript bindings
noremap <Leader>cc :CoffeeCompile vert<CR>
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

let g:UltiSnipsExpandTrigger="<C-j>"

au BufNewFile,BufRead *.ejs set filetype=html

set fillchars+=stl:\ ,stlnc:\

let g:screen_size_restore_pos = 1
let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

let g:jedi#popup_select_first=0

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
set foldmethod=syntax
set foldlevelstart=99

set omnifunc=syntaxcomplete#Complete

" Don't mess with mah 'K' binding!
let g:go_doc_keywordprg_enabled = 0

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

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin indent on
syntax on
set rtp+=/usr/local/opt/fzf
