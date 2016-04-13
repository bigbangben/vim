
set nocompatible
set syntax=on
set go=e
colo evening
set list
set listchars=tab:>-,trail:-
set expandtab
set autoindent
set ts=4
set softtabstop=4 
set shiftwidth=4
set number
set wildmode=list:full
set wildmenu
set encoding=utf-8
set termencoding=utf-8 
set fileencoding=utf-8 
set fileencodings=ucs-bom,utf-8,chinese,cp936
set guifont=Courier_new:h11  
source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8



filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"此处规定Vundle的路径
set rtp+=$VIM/vimfiles/bundle/vundle/

"此处规定插件的安装路径
call vundle#rc('$VIM/vimfiles/bundle/')

Bundle 'gmarik/vundle'


Bundle 'taglist.vim'
Bundle 'SuperTab'
Bundle 'vimwiki'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'matrix.vim--Yang'
Bundle 'FencView.vim'
Bundle 'Conque-Shell'
Bundle 'Vimpress'
Bundle 'Markdown'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'snipMate'
Bundle 'AutoComplPop'
Bundle 'UltiSnips'
Bundle 'minibufexplorerpp'

let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction 
  
nmap wm :WMToggle<CR> 
nmap zz :Matrix<CR>

autocmd FileType * call UltiSnips#FileTypeChanged()
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:SuperTabDefaultCompletionType="context"

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in

  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set ignorecase
set nobackup
set tags=tags;
set autochdir

let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1 

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"F4 NERDTree
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>

"F5 TlistToggle
map <F5> :TlistToggle<CR>
imap <F5> <ESC>:TlistToggle<CR>

map <F3> :%s#^#//#g<CR>
map <F2> :%s#//##g<CR>


