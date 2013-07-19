syntax on

set number

set smartindent
set autoindent
set nocompatible

set shiftwidth=4
set tabstop=4

"set paste
set ruler

set virtualedit=block

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set showmode
set cursorline
colorscheme torte
"hi CursorLine cterm=NONE ctermbg=18 ctermfg=15 guibg=darkblue guifg=white
highlight normal ctermbg=none
highlight CursorLine cterm=underline ctermfg=none ctermbg=none
highlight LineNr term=NONE cterm=NONE ctermfg=0 ctermbg=7
highlight StatusLine ctermfg=26 ctermbg=15

"set statusline=%<%F%h%m%r%=%b\ 0x%B\ \ %l\/%L,%c%V\ %P
set statusline=%<%F%h%m%r%=%b\ 0x%B\ \ %l\/%L,%c%V\ %P\ %{(&fenc==\"\"?&enc:&fenc)}
set laststatus=2

set list
"set listchars=tab:»\ ,trail:␣,eol:↡
set listchars=tab:^·,trail:␣,eol:¶
"set listchars=tab:»—,trail:␣,eol:↡
highlight SpecialKey ctermfg=238
highlight ExtraWhitespace ctermfg=247
highlight NonText ctermfg=238
"highlight TabLine ctermfg=white
"highlight TabLineFill ctermfg=gray
"highlight TabLineSel ctermfg=gray

if has("autocmd")
	filetype plugin indent on
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	exe "normal g`\"" |
		\ endif
endif
