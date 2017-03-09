execute pathogen#infect()
syntax on
filetype plugin indent on
set cindent
"autocmd FileType python,php,erlang setlocal et sta sw=4 sts=4 ts=4
autocmd FileType python,php,erlang setlocal et sta sw=4 sts=4
"autocmd FileType c,cpp,h,hpp,cc,cxx,tcc,sh,lua,bidl setlocal et sta sw=4 sts=4 ts=4
"autocmd FileType c,cpp,h,hpp,cc,cxx,go,tcc,java,xml,sh,lua,bidl setlocal et sta sw=4 sts=4
autocmd FileType c,cpp,h,hpp,cc,cxx,tcc,java,xml,sh,lua,bidl,json,sql setlocal et sta sw=4 sts=4
set hlsearch
set backspace=2

" For chinese coding
"set encoding=utf-8
"set fileencodings=utf-8,chinese,latin-1
" gbk cp936
"set encoding=gb2312
"set fileencodings=euc-cn,cp936,utf-8,chinese,latin-1
"set fileencodings=euc-cn,cp936,utf-8,ucs-bom
if has("win32")
  "set fileencoding=chinese
else
  "set fileencoding=utf-8
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
let g:NERDTreeDirArrows=0

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

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Winmanager 
let g:winManagerWindowLayout="NERDTree"  
"let g:winManagerWindowLayout="NERDTree|TagList"  
"let g:winManagerWindowLayout='FileExplorer|TagList'

"nmap wm :WMToggle<cr> :TlistOpen<cr>
nmap wm :WMToggle<cr> :TagbarToggle<cr>

nnoremap <silent> <F12> :A<CR>

nnoremap <silent> <F3> :Grep<CR>

let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

set ruler

set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,utf-16,euc-cn,cp936,ucs-bom

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:go_fmt_command = "goimports"

colorscheme desert
