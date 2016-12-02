set number " show line numbers
"set wildmenu " visual autocomplete for command menu
set wildchar=<Tab> wildmenu wildmode=full
set lazyredraw " redraw only when needed (faster macros)
set showmatch " highlight matching parentheses
set incsearch " search as characters are entered (/f /fo /foo)

" title settings - it should show the name of the file being edited
let titlestrtring = expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
"set title
" title settings end

" tab settings - it should be 4 spaces to conform with PEP for python
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
" tab settings end

" arrow keys wrap around starts and ends of lines
set whichwrap+=<,>,[,]

"################# custom keybindings ###########################
" essentials first!

" map leader is comma
let mapleader = ","
" easy command
nnoremap ; :
" easy insert
nnoremap <space> i
" pain free esc
inoremap jk <esc>
inoremap kj <esc>

" swift vimrc updates - source reloads the vimrc without leaving vim
nnoremap <leader>rv :source $MYVIMRC<CR>

"""""""""_SHELL COMMAND SHORTCUTS_""""""""""""""""""""""""""""
"                                                            "
"" slow but steady start:                                    "
nnoremap ! :!<space>
"" <C-Z> (Ctrl Shift z) will pause vim and go to terminal    "
"" fg<CR> (in terminal) will return back to vim              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" helpful '"dip-into (and out of) insert mode" key modifications""
nnoremap <tab> i<tab><esc>
nnoremap <CR> o<esc>
nnoremap <backspace> i<backspace><right><esc>
nnoremap <delete> i<delete><right><esc>

" modification of w => word to be whole word when selecting, deleting or changing but keep spaces
nnoremap dw diw
nnoremap dW diW
nnoremap cw ciw
nnoremap cW ciW
nnoremap vw viw
nnoremap vW viW

" auto 'change in' for parantheses
nnoremap c( ci(
nnoremap c[ ci[
nnoremap c{ ci{
nnoremap c< ci<
nnoremap c" ci"
nnoremap c' ci'

" ************  MOVEMENT  ************************************

" remove j and k bindings
noremap j <Nop>
noremap k <Nop>

" speedy movement: replace $ ^ { }
noremap <end> $
noremap <home> ^
noremap <pageup> {
noremap <pagedown> }
noremap [ {
noremap ] }

" ************  WINDOWS  ************************************

" Window movement
nnoremap <M-right> <C-W><right>
nnoremap <M-left> <C-W><left>
nnoremap <M-up> <C-W><up>
nnoremap <M-down> <C-W><down>

" Open window below instead of above"
nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Vertical equivalent of C-w-n and C-w-N"
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>V :let spr=&spr<BAR>set spr<BAR>vnew<BAR>let &spr=spr<CR>

" open new windows 
nmap <C-up> <C-w>n
nmap <C-down> <C-w>N
nmap <C-left> <C-w>v
nmap <C-right> <C-w>V

" ************  SELECTIONS  ************************************

" shift-left/right into visual mode
nnoremap <S-left> v<left>
nnoremap <S-right> v<right>
" ctrl-shift-left/right into visual mode select to start/end
nnoremap <C-S-left> v^
nnoremap <C-S-right> v$
" same again for insert mode
inoremap <S-left> <esc>v<left>
inoremap <S-right> <esc>v<right>
inoremap <C-S-left> <esc>v^
inoremap <C-S-right> <esc>v$

" shift-up/down into visual line mode (with $ appendage)
nnoremap <S-up> V$
nnoremap <S-down> V$
" control-shift-up/down into visual block mode
nnoremap <C-S-up> <C-V>
nnoremap <C-S-down> <C-V>
" remove shift up and shift down scrolling up/down by page
vnoremap <S-up> <up>
vnoremap <S-down> <down> 
" same again for insert mode
inoremap <S-up> <esc>v<up>
inoremap <S-down> <esc>v<down>

" easy toggle from visual line mode or visual mode to visual
" block mode and out of visual block mode
vnoremap <CR> <C-V>
"************************************************************

" Always show statusline
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" RANGER bindings
nnoremap <leader>rg :<C-U>RangerChooser<CR>

" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . WINDOWS(temp)


    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . ndow movements; I do this often enough to warrant using up M-arrows on this"
nnoremap <M-Right> <C-W><Right>
nnoremap <M-Left> <C-W><Left>
nnoremap <M-Up> <C-W><Up>
nnoremap <M-Down> <C-W><Down>

" Open window below instead of above"
nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Vertical equivalent of C-w-n and C-w-N"
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>V :let spr=&spr<BAR>set nospr<BAR>vnew<BAR>let &spr=spr<CR>

" I open new windows to warrant using up C-M-arrows on this"
nmap <C-M-Up> <C-w>n
nmap <C-M-Down> <C-w>N
nmap <C-M-Right> <C-w>v
nmap <C-M-Left> <C-w>V
shellescape(temp)

    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()


