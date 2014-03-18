syntax on

set number

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis,iso-2022-jp
set fileformats=unix,dos,mac

set smartindent
set autoindent
set nocompatible

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"set paste
set ruler

"set virtualedit=all
set virtualedit=block

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set showmode
set cursorline
set cursorcolumn
colorscheme torte
"hi CursorLine cterm=NONE ctermbg=18 ctermfg=15 guibg=darkblue guifg=white
highlight normal ctermbg=none
highlight CursorLine cterm=underline ctermfg=none ctermbg=none
highlight CursorColumn cterm=none ctermfg=none ctermbg=235
highlight LineNr term=none cterm=none ctermfg=0 ctermbg=7
highlight StatusLine ctermfg=26 ctermbg=15

"set statusline=%<%F%h%m%r%=%b\ 0x%B\ \ %l\/%L,%c%V\ %P
set statusline=%<%F%h%m%r%=%b\ 0x%B\ \ %l\/%L,%c%V\ %P\ %{(&fenc==\"\"?&enc:&fenc)}
set laststatus=2

set list
"set listchars=tab:»—,trail:¸,eol:˥
set listchars=tab:^·,trail:¸,eol:¶
"set listchars=tab:»—,trail:¸,eol:¬
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
        \   exe "normal g`\"" |
        \ endif
endif

"" ##################################################
"" Vundle
"" ##################################################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'jiangmiao/auto-pairs'
Bundle 'godlygeek/tabular'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"" ##################################################
"" Vim-LaTeX
"" ##################################################
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -l -ot "-kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -l -u -ot "-kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf.bat $*.ps'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_dvi = 'uplatex -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'pbibtex -kanji=utf8'
"let g:Tex_BibtexFlavor = 'upbibtex'
"let g:Tex_BibtexFlavor = 'bibtex'
"let g:Tex_BibtexFlavor = 'bibtexu'
let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
"let g:Tex_MakeIndexFlavor = 'makeindex $*.idx'
"let g:Tex_MakeIndexFlavor = 'texindy $*.idx'
let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance -inverse-search "C:\vim\gvim.exe -n -c \":RemoteOpen +\%l \%f\""'
"let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL firefox -new-window'
"let g:Tex_ViewRule_pdf = 'powershell -Command "& {$p = [System.String]::Concat(''"""'',[System.IO.Path]::GetFullPath($args),''"""'');Start-Process chrome -ArgumentList (''--new-window'',$p)}"'
"let g:Tex_ViewRule_pdf = 'pdfopen --rxi --file'
let g:Tex_ViewRule_ps = 'rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance'
let g:Tex_ViewRule_dvi = 'cmd /c start $*.dvi'

au BufWritePost *.tex silent call Tex_RunLaTeX()
au BufWritePost *.tex silent !pkill -USR1 xdvi.bin
