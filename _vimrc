execute pathogen#infect()
syntax on
filetype plugin indent on
set cindent
autocmd FileType python,php,erlang setlocal et sta sw=4 sts=4
autocmd FileType c,cpp,h,hpp,cc,cxx,tcc,sh,lua,bidl setlocal et sta sw=4 sts=4
set hlsearch

" For chinese coding
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
  set fileencoding=chinese
else
  set fileencoding=utf-8
endif

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
" if has("autocmd")
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | 
" \ exe "normal! g'\"" | 
" \ endif
"endif

if has("autocmd")
  autocmd BufRead *.txt set tw=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal g'\"" |
    \ endif
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

"Set mapleader
let mapleader = ","
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

" ctags
map <C-]> :tselect <C-R>=expand("<cword>")<CR><CR>
map <C-]> g<C-]>

" Minibuf
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplorerMoreThanOne=0 

" Nerd tree
let g:NERDTree_title="[NERDTree]"  
let NERDTreeIgnore = ['.*\.o$','.*\.vcproj$','.*\.ko$','.*\.gz$','^tags$']

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
      
function! NERDTree_IsValid()  
    return 1  
endfunction 

" Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

" Winmanager 
let g:winManagerWindowLayout="NERDTree"  
"let g:winManagerWindowLayout="NERDTree|TagList"  
"let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> :TlistOpen<cr>

nnoremap <silent> <F12> :A<CR>

nnoremap <silent> <F3> :Grep<CR>

let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
