call plug#begin()
Plug 'fatih/vim-go'
Plug 'tomasr/molokai'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/neocomplete.vim'
Plug 'mbbill/undotree'
Plug 'Townk/vim-autoclose'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

" begin vim c support
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen  = 'yes'
" end vim c support

let mapleader=","		" Set leader key
set encoding=utf-8		" Set encoding
set autowrite			" Write on build etc.
set number			" Set line numbers
set relativenumber		" Set relative line number
set clipboard=unnamed		" Use sys clipboard
set spell			" Check spell

" use go imports
let g:go_fmt_command = "goimports"

" go error list shortcuts
filetype plugin on
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" go shortcuts
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tt  <Plug>(go-test-func)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>cb  <Plug>(go-coverage-browser)
autocmd FileType go nmap <Leader>n <Plug>(go-rename)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
autocmd FileType go nmap <leader>d  <Plug>(go-def)
autocmd FileType go nmap <leader>i  <Plug>(go-describe)
"autocmd FileType go nmap <leader>j  <Plug>(go-decls)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" go highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_sameids = 1
let g:go_highlight_trailing_whitespace_error= 1

" go type info
let g:go_auto_type_info = 1

" go snippeds
let g:go_snippet_case_type = "camelcase"

" color scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" go meta linter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Airline 
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols='unicode'
let g:airline#extensions#whitespace#enabled = 0

" NERDTree & NERDTree tabs plugins
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_focus_on_files = 1
nnoremap <leader>n :NERDTreeToggle<CR>

" Powerline
set laststatus=2
set fillchars+=stl:\ ,stlnc:\

" Neocompleate
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 0
inoremap <expr><Space> pumvisible() ?  neocomplete#close_popup() : "\<Space>"

" Undo tree
nnoremap <F5> :UndotreeToggle<cr>
if !exists('g:undotree_SetFocusWhenToggle')
	let g:undotree_SetFocusWhenToggle = 1
endif

"Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
