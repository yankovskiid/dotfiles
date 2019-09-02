set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required
Plugin 'slim-template/vim-slim.git' " slim syntax highlighting for vim
Plugin 'tpope/vim-fugitive'         " git integration
Plugin 'airblade/vim-gitgutter'     " shows git diff changes to the left
Plugin 'bling/vim-airline'          " nice status line
Plugin 'enricobacis/vim-airline-clock' " add clock to airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'cristianoliveira/vim-react-html-snippets' " react snippets
"Plugin 'SirVer/ultisnips' " needed to work plugin above
Plugin 'mhartington/oceanic-next' " colorscheme for vim
Plugin 'rakr/vim-one'
Plugin 'mechatroner/rainbow_csv'  " use csv with RBQL
call vundle#end()            " required
filetype plugin indent on

syntax enable

"oceanic-next setting
if (has("termguicolors"))
  set termguicolors
 endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'
set t_Co=256 " setting for OceanivNext colorscheme

"let g:airline_theme='one'
"colorscheme one
"set background=light

"colorscheme mustang

set encoding=utf-8
set cursorline
set wildmenu "lets you see what your other options for <Tab>
set relativenumber  " shows relative numbers
set number
set showcmd
set ruler "shows the cursor position
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab "needed for tabbing
set autoindent "copy indent from current line when starting a new line
set smartindent "does smart autoindenting
set backspace=indent,eol,start
set list "enables showing of hidden chars
set listchars=tab:▸\ ,eol:¬,trail:∙
set lcs+=space:∙ "show space as '·'
set clipboard=unnamed

" Make it obvious where 100 characters is
set textwidth=100
set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

nnoremap <Space> i_<Esc>r
nmap ,cf :let @*=expand("%")<CR>
nmap ,cp :let @*=expand("%:p")<CR>

nmap <C-g> :Rg<CR>

" Forcing myself to stop using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

au BufWritePre * %s/\s\+$//e " removes trailing spaces
au BufNewFile * set noeol     " removes eol

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
" au BufWinEnter *.rb let w:m2=matchadd('ErrorMsg', '\%>80v.\+',-1) " highlights more than 80 symbols

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:netrw_winsize = 30     " netrw winsize
let g:netrw_banner = 0       " removes banner

"nnoremap <C-p> :CommandT<CR>

"snittep command
let g:UltiSnipsExpandTrigger="<tab>"

"FZF shortcut
nnoremap <C-p> :call FzfOmniFiles()<CR>
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

ca tn tabnew

commmand BuffersClose call <SID> BuffersClose()
func BuffersClose()
  execute "%bd|e#"
endfunc
