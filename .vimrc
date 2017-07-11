
"{{{Auto Commands
execute pathogen#infect()

" Trim trailing empty lines in file
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$##

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

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

" Who wants an 8 character tab?  Not me!
set shiftwidth=2
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
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"{{{Look and Feel

" Favorite Color Scheme
if has("gui_running")
   " Remove Toolbar
   set guioptions-=T
   colorscheme gruvbox
   set bg=dark
   set guifont=Menlo\ for\ Powerline
else
   colorscheme gruvbox
   set guifont=Hack
   set bg=dark
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
      let g:monocle = 1 "monocle mode is ON
   else
      call feedkeys("\<C-W>=")
      let g:monocle = 0 "monocle mode is OFF
   endif
endfunction

function! SplitMovement(direction)
   let aftermove = ""
   let move = ""
   if g:monocle == 1
      let aftermove = "\<C-W>_\<C-W>|"
   endif
   let move = "\<C-W>".a:direction
   call feedkeys(move.aftermove)
endfunction

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
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
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

"let mapleader=" "

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
nnoremap <silent> <C-t> :tabnew<CR>

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

"nnoremap <silent> J 10j
"nnoremap <silent> K 10k
nnoremap <silent> J <PageDown>M
nnoremap <silent> K <PageUp>M

vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

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
"nnoremap <leader>par :%s/^>$//<CR>

" EasyMotion leader
"let g:EasyMotion_leader_key = ':'
nmap s :w
nmap S :b

" Powerline
let g:Powerline_symbols = 'fancy'


"ly$O#{{{ "lpjjj_%A#}}}jjzajj

"}}}

"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}

" {{{ HTML5 support
"let g:html5_event_handler_attributes_complete = 0
"let g:html5_rdfa_attributes_complete = 0
"let g:html5_microdata_attributes_complete = 0
"let g:html5_aria_attributes_complete = 0
" }}}

au BufNewFile,BufRead *.ejs set filetype=html

let g:screen_size_restore_pos = 1
let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

let g:jedi#popup_select_first=0

let g:airline_powerline_fonts = 1
set tabstop=2
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](vendor|bower_components|node_modules|\.(hg|svn))$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ }
" Insert into your .vimrc after quick-scope is loaded.
" Obviously depends on <https://github.com/unblevable/quick-scope> being installed.

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

" vim-ctags
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']

"set tags=tags;~
set tags+=.git/tags
set shell=/bin/bash
let g:ctrlp_max_files=0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

syn match Oddlines "^.*$" contains=ALL nextgroup=Evenlines skipnl
syn match Evenlines "^.*$" contains=ALL nextgroup=Oddlines skipnl

let g:ycm_confirm_extra_conf = 0

set rtp+=~/.fzf

" {{{ CoffeeScript-specific
let coffee_lint_options = '-f ~/.coffeelint.json'
function! LintCoffee()
  :CoffeeLint! | cwindow
endfunction

" call coffeecompile if the buffer is already open
function! CoffeeRecompile()
   if bufwinnr('CoffeeCompile') > 0
      :CoffeeCompile vert
   endif
endfunction

" Don't lose focus!
function! CoffeeCompile2()
  :CoffeeCompile vert
  wincmd p
endfunction

function! CoffeeRun2()
  :CoffeeRun
  wincmd p
endfunction

autocmd BufWritePost *.coffee call CoffeeRecompile()
"
"" Run file or visual selection through coffee compiler
nnoremap <buffer> <Leader>cc :call CoffeeCompile2()<CR>
vnoremap <buffer> <Leader>cc :call CoffeeCompile2()<CR>
nnoremap <buffer> <Leader>cr :call CoffeeRun2()<CR>
vnoremap <buffer> <Leader>cr :call CoffeeRun2()<CR>
nnoremap <buffer> <Leader>cl :call LintCoffee()<CR>
vnoremap <buffer> <Leader>cl :call LintCoffee()<CR>

nnoremap <silent> <C-I> :call CoffeeRun2()<CR>
vnoremap <silent> <C-I> :call CoffeeRun2()<CR>

" }}}

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-J>"

filetype plugin indent on
syntax on
