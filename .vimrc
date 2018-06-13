set encoding=utf8


" Deixa acessar o clipboard do sistema
set clipboard=unnamed

" inicia o modo spell check
" set spell
set spelllang=pt_br



" Iniciar o sistema de plugin
call plug#begin('~/.toaster/plugins')

Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'ajh17/VimCompletesMe' 
Plug 'kien/ctrlp.vim'
Plug 'dbmrq/vim-ditto'
Plug 'yangmillstheory/vim-snipe'
Plug 'mileszs/ack.vim'
Plug 'gregsexton/MatchTag'
Plug 'haya14busa/incsearch.vim'
Plug 'mattn/emmet-vim'
Plug 'sqwishy/vim-sqf-syntax'
Plug 'dracula/vim'
" Plug 'chrisbra/csv.vim'

" Específicos para escrever 
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'rhysd/vim-grammarous'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configurações 
""""""""""""""""""""""""""""""""""""""
set nowrap

" Fix para backspace não funcionando no OSX
set backspace=indent,eol,start

" Mostra números nas linhas
set number
set numberwidth=5
set relativenumber

" Tabs do jeito correto
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Modo ELITE (Sem setinhas pra forçar no HJKL)
let g:elite_mode=1

" Deixa a linha com highlight 
set cursorline
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLine   cterm=NONE ctermbg=darkgrey 

" Desativa status line
set noshowmode

" Splits sempre pra baixo e pra direita
set splitbelow
set splitright

" Csutomização de temas 
syntax on
set t_Co=256
let base16colorspace=256
color dracula
set background=dark

" Usa configurações de Devicons no Nerdtree 
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Some com os scrolls na versao com gui
set guioptions=

" Tira avisos (Bell)
set t_vb=
set novisualbell

" Determina a fonte correta para o gvim ou macvim
" Use set guifont=* para escolher e set guifont? para saber qual o nome
" correto
" Em seguida use put =&guifont para adicionar a fonte no buffer
set guifont=Source\ Code\ Pro\ for\ Powerline:h15

" Usar o Ack com o AG
let g:ackprg = 'ag --vimgrep'

" Configurra o Startify
let g:startify_custom_header = [
\'',
\'',
 \'         ######                                                                                   ', 
 \'       #########                                                                                  ', 
 \'      ###########       ####    ##   ##   ### ##### #####   ####   ###  #     #    # #####        ', 
 \'      ###     ##       #####   ###   ###  ### ##### ###### #####  ## #  #     #    # ##  ##       ', 
 \'      ###        j     ##      ###   ### #### ##    ##  ## ##    ##     #     #    # ##   #       ', 
 \'     ###       jjj    ###     #####  ######## ##### ##  ## ####  ##     #     #    # ##  ##      ',  
 \'     ###      jjjj    ### ### ## ##  ######## ##### ######  #######     #     #    # ######     ',   
 \'     ###    jjjjjj    ###  ## #####  ######## ##    ## ##      ####     #     #    # ##   #    ',    
 \'      ###      jjj     ############# ##   ### ##### ## ### ###### #     #     ##  ## ##   #    ',    
 \'      ## j   jjjj      ##### ##   ## ##   ### ##### ##  ## #####  ##### #####  ####  ######  ',      
 \'       jjjjjjjjj                                                                         ',         
 \'        jjjjjjj                                                                         ',           
 \]                                                                                        

let g:startify_files_number = 6
let g:startify_list_order = [
      \ ['   Used files in this dir:'],
      \ 'dir',
      \ ['   Used files overall:'],
      \ 'files',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'bundle/.*/doc',
      \ ]

" Configura o Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

" Extensões especificas para o controlP
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" Desabilita setas e usa para mudar size de split
let g:elite_mode=1

" Suporte a Markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Settings especificas para escrita 
let g:pencil#wrapModeDefault = 'soft'   " padrao é 'hard'

" Configuração do Vim-pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Se o modo Elite estiver ligado desabilita as setinhas
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif







"""""""""""""""""""""""""""""""""""""
" Mappings 
""""""""""""""""""""""""""""""""""""""

" Mais facil navegar nos splits de janelas
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mais fácil para navegarentre os buffers
nnoremap <silent> <S-LEFT> :bp<CR>
nnoremap <silent> <S-RIGHT> :bn<CR>
nnoremap <silent> <S-DOWN> :bd<CR>

" Abre o NerdTree
map <C-n> :NERDTreeToggle<CR>

" Executa o Corretor Ortográfico em Português
map <F3> :GrammarousCheck --lang=pt-BR<CR>

" Executa o mesmo corrtetor só que em Inglês
map <F4> :GrammarousCheck

" Mappings para o corretor ortográfico
nmap <F6> <Plug>(grammarous-open-info-window) 	
nmap <F7> <Plug>(grammarous-fixit) 	
nmap <F8> <Plug>(grammarous-move-to-next-error) 	
nmap <F5> <Plug>(grammarous-move-to-previous-error
