set mouse=a
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'henrik/vim-indexed-search'

Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dawikur/algorithm-mnemonics.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'scrooloose/nerdcommenter'

Plugin 'EinfachToll/DidYouMean'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-surround'

Plugin 'mileszs/ack.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'joshdick/onedark.vim'
call vundle#end()
filetype plugin indent on
set nu
syntax on
set spell
set cursorline
set ruler
set backspace=indent,eol,start
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set background=dark

if (!has("gui_running") && ($EMULATOR == "cmder"))
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"

    " Fix backspace with xterm
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

colorscheme onedark
let g:airline_theme='onedark'

autocmd vimenter * NERDTree

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
set encoding=utf-8
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0  " No max number of files
let g:ctrlp_working_path_mode = 0  " search from current directory
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
"if executable('ag')
"    set grepprg=ag\ --nogroup\ --nocolor
"    let g:ctrlp_user_command = 'ag -i --nocolor --nogroup --hidden -g "" %s'
"endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
let g:airline_powerline_fonts = 1

" Stolen from https://github.com/Valloric/YouCompleteMe/issues/36
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Trim trailing spaces on save
autocmd FileType c,cpp,cxx,hxx,h,cs,java,js,json,php autocmd BufWritePre <buffer> %s/\s\+$//e

" Replace tabs with spaces
autocmd FileType c,cpp,cxx,hxx,h,cs,java,js,json,php autocmd BufWritePre <buffer> retab

" Vim JavaScript settings
let g:javascript_plugin_jsdoc = 1

" Set gvim font
if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
else
    set guifont=Source\ Code\ Pro\ for\ Powerline:h11
end

" Nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
