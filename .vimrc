
" Colorscheme
set background=dark
colorscheme one-dark

" Deixa acessar o clipboard do sistema
set clipboard=unnamed

" Iniciar o sistema de plugin
call plug#begin('~/.toaster/plugins')

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'ajh17/VimCompletesMe' 
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

" Liga o Syntax se está no modo terminal com cores ou GUI
" Também deixa colorido o último search pattern
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Configura o VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" Configura o ControP para rodar com o Silver Searcher ( https://github.com/ggreer/the_silver_searcher)
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden --filename-pattern "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ALE linting events
  if g:has_async
    set updatetime=1000
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Configura o Minimap
let g:minimap_highlight='Visual'
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




" Mappings
nmap <F3> :VimFilerExplorer<CR>
nmap <F4> :TagbarToggle<CR>
nnoremap <silent> <S-UP> :BufExplorer<CR>
nnoremap <silent> <S-LEFT> :bn<CR>
nnoremap <silent> <S-RIGHT> :bp<CR>
nnoremap <silent> <S-DOWN> :bd<CR>
nnoremap <Leader>c :set cursorline!<CR>


" Mais facil navegar nos splits de janelas
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>


" VimCompleteMe
imap <Tab> <C-P>

" Goyo
nnoremap <silent> <F5> :Goyo<CR>

" Minimap
nnoremap <silent> <F2> :MinimapToggle<CR>
" Autocommands
"autocmd BufReadPost * VimFilerExplorer

" Configurações
set number
set numberwidth=5
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi CursorLine   cterm=NONE ctermbg=darkgrey 
set cursorline!
set splitbelow
set splitright

" Determina a fonte correta para o gvim ou macvim
" Use set guifont=* para escolher e set guifont? para saber qual o nome
" correto
" Em seguida use put =&guifont para adicionar a fonte no buffer
set guifont=Source\ Code\ Pro\ for\ Powerline:h15

" Some com os scrolls na versao com gui
set guioptions=

" Tira avisos (Bell)
set t_vb=
set novisualbell




