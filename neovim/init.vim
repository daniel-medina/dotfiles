set nocompatible
filetype plugin indent on
syntax on
set number
set autoindent
set smartindent
set hidden
set expandtab
set shiftwidth=2
set tabstop=2

" Variables
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:netrw_banner = 1
let g:airline#extensions#tabline#enabled = 1

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" Deoplete configuration
let g:deoplete#auto_complete_delay = 5
let g:deoplete#auto_refresh_delay = 100
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Tern
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.pug

" Rebinds
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-Enter>"

" I allow C-j and C-k in addition of tab to cycle through suggestions
inoremap <expr><TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nmap <silent> <F7> :BufExplorer<CR>
nmap <silent> <F8> :Explore<CR>
nmap <silent> <F9> :Autoformat<CR>
nmap <silent> <C-p> :bnext<CR>
nmap <silent> <C-n> :tabnew<CR>
nmap <silent> <C-x> :tabclose<CR>
nmap <silent> <C-h> :tabp<CR>
nmap <silent> <C-l> :tabn<CR>
nmap <silent> <A-n> :sp<CR>
nmap <silent> <A-p> :vsp<CR>
nmap <silent> <A-x> <C-W>q<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> <A-Up> :res -3<CR>
nmap <silent> <A-Down> :res +3<CR>
nmap <silent> <A-Left> :vertical res -3<CR>
nmap <silent> <A-Right> :vertical res +3<CR>

" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" PLUGINS HERE
" ------------------------------------
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'posva/vim-vue'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'othree/html5.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'ervandew/supertab'
NeoBundle 'carlitux/deoplete-ternjs'
NeoBundle 'othree/jspc.vim'
NeoBundle 'Chiel92/vim-autoformat'

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
