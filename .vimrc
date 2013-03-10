" -------------------------------------
" Configuration de base
" -------------------------------------

set expandtab           " Convertit les tab en espaces
set tabstop=4           " Quatre espaces par tab
set shiftwidth=4        " pareil, mais pour l'auto-indent
set textwidth=80        " max 80 caractères par ligne
set smartindent         " Indentation
set cindent             " Indentation
set autoindent          " Indentation

syntax on               " Code en couleur
set number              " Numéros des lignes
set hlsearch            " Surligne la recherche
set ignorecase          " Ignore la case de recherche
set smartcase           " Regarde la case si majuscules
set title               " Titre fenêtre

set list                " Affiche les caractères invisibles
set lcs:trail:.,tab:>-  " Redéfini les caractères invisibles
set autoread            " Recharge si le fichier a été modifié
set nowrap              " Pas de saut à la ligne auto
set nofoldenable        " Folding off par défaut
set foldmethod=indent   " Folding sur l'indentation

" -------------------------------------
" Vim Improved
" -------------------------------------

" Reste en mode visuel après indentation
vnoremap < <gv
vnoremap > >gv

" Onglets
map <C-T> :tabnew<CR>
nmap <S-Right> :tabnext<CR>
nmap <S-Left> :tabprevious<CR>
imap <S-Right> <ESC>:tabnext<CR>
imap <S-Left> <ESC>:tabprevious<CR>
set showtabline=2

" Completion magique
function InsertTabWrapper(direction)
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
elseif "backward" == a:direction
return "\<c-p>"
else
return "\<c-n>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>

" Backup
if filewritable($HOME."/.vim/backup")
    set backup
    set backupdir=$HOME/.vim/backup
endif

" Swap
if filewritable($HOME."/.vim/swap")
    set directory=$HOME/.vim/swap
else
    set directory=/tmp
endif

"Remove indenting on empty lines
nmap <silent> <F2> :%s/\s*$//g<cr>:noh<cr>

" Ignore pour *
set wildignore=*.o,*.obj,*.bak,*.exe

" -------------------------------------
" Configuration desktop
" -------------------------------------

" C/C avec X
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-c> : call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" terminal local,
" 256 couleurs, affichage rapide,
" beau thème
set t_Co=256
set ttyfast
colorscheme glade_bob
