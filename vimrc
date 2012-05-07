" - help
" http://vim-users.jp/2009/07/hack45/
" http://vim-users.jp/2011/02/hack199/

" http://vim-jp.org/vimdoc-ja/index.html
" http://vim-jp.org/vimdoc-ja/quickref.html

" http://vim-jp.org/blog/2011/11/12/learn_vimscript.html
" http://d.hatena.ne.jp/thinca/20100201/1265009821

""set           : modified option only
""set all
""options
""
""set termcap
""set {option}? : ���ߤ�������
""set {option}& : default���᤹

"encoding, fileencoding�������������ϡ�
"iconv -l
":language
"���ǧ���ޤ��礦��
"
" ���Υե�����Ǥϡ�libiconv�����������Ȥ�����
" converters/libiconv�� EXTRA_ENCODINGS �դ���
" ����ѥ��뤵��Ƥ��뤫��ǧ���ޤ��礦��

"-----------------------------------------------------------------------------
" 1 important
set nocompatible

""cpoptions

set noinsertmode

""paste
""pastetoggle
"runtimepath
"set helpfile=


" 2 moving around, searching and patterns

"set whichwrap=<, >, h, l, [, ]
"set nostartofline
""paragraphs
""sections

set path+=/usr/local/include

""cdpath
""autochdir
""wrapscan

set noincsearch

set magic

set noignorecase

set smartcase

""maxmempattern
""define
""include
""includeexpr


" 3 tags
""tagbsearch
""taglength
""tags
""tagrelative
""tagstack
""showfulltag
""cscopeprg
""cscopetag
""cscopetagorder
""cscopeverbose
""cscopepathcomp
""cscopequickfix
""cscoperelative


" 4 displaying text
""scroll
""scrolloff

set nowrap

""linebreak
""breakat
""showbreak
""sidescroll
""sidescrolloff

"set display=lastline,uhex
set display=lastline

""fillchars

set cmdheight=1

""columns
""lines
""window
""lazyredraw
""redrawtime
""writedelay

set list

"set listchars=tab:^\ ,extends:<,trail:-,eol:<
"eol�ѻ�, precedes�ɲ�,
set listchars=tab:^\ ,extends:>,precedes:<,trail:-

""number
""relativenumber
""numberwidth
"conceallevel
"concealcursor


" 5 syntax, highlighting and spelling
"background

filetype plugin on
""filetype

if !exists("syntax_on")
  syntax on
endif
""syntax

""synmaxcol

"highlight

set hlsearch

""cursorcolumn
""cursorline
""colorcolumn

set spell

""spelllang
""spellfile
""spellcapcheck
""spellsuggest
""mkspellmem


" 6 multiple windows

set laststatus=2

"hi StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

set statusline=%y%{GetStatusEx()}%F[%n]%m%r%=[%B]<%c:%l/%L>(%p%%)
" ʸ�����󥳡��ǥ��� & ���ԥ����ɼ���
function! GetStatusEx()
	let str = ''
	let str = str . '' . &fileformat . ']'
	if has('multi_byte') && &fileencoding != ''
		let str = '[' . &fileencoding . ':' . str
	endif
	return str
endfunction

""equalalways
""eadirection
""winheight
""winminheight
""winfixheight
""winfixwidth
""winwidth
""winminwidth
""helpheight
"previewheight
"previewwindow

set hidden

"switchbuf

set splitbelow
set splitright

"scrollbind
"scrollopt
"cursorbind


" 7 multiple tab pages

set showtabline=2
nmap <F2> :tabnew<CR>
nmap <F3> :tabnext<CR>

"tabpagemax
"set tabline=%M%t[%n]


" 8 terminal

"term
"ttytype
"ttybuiltin
"ttyfast
"weirdinvert
"esckeys
"scrolljump
"ttyscroll

set title

"titlelen
"titlestring
"titleold
""icon
""iconstring


" 9 using the mouse

set mouse=a

"mousemodel
"mousetime
"ttymouse


"10 printing
" ��ά


"11 messages and info

"terse
"shortmess

set showcmd

set showmode

set ruler

""rulerformat

""report
""verbose
""verbosefile
""more
""confirm
""errorbells
""visualbell
"set t_vb=
""helplang


"12 selecting text

"selection
"selectmode
"keymodel


"13 editing text

""undolevels
""undoreload
""modified
""readonly
""modifiable
""textwidth
"set wrapmargin=1

set backspace=indent,eol,start

""comments

set formatoptions+=mM

"formatlistpat
"formatexpr

"complete
"completeopt
""pumheight
"completefunc

"������䴰��Ȥ��ˤ����꤬ɬ�ס�
"����Ǥ�ե����륿���ץץ饰�����"ͭ���ˤ�"�Ƥ���ɬ�פ����롣
".vimrc �˰ʲ��ιԤ�񤭲ä��Ƥ�������:
"   filetype plugin on
"   �ޤ���:
"	filetype plugin indent on
"C �Υ������ǥ�����䴰��Ԥ��ˤ� tags �ե����뤬ɬ�פǤ��롣Exuberant ctags��
"�䴰��ɬ�פ��ղþ������Ϥ��뤿�ᡢExuberant ctags ��Ȥ��Ȥ褤��
"
"Ctrl-x Ctrl-o
"omnifunc

""dictionary
"thesaurus
"infercase
"digraph
""tildeop
""operatorfunc

set showmatch

"matchtime
"matchpairs

set nojoinspaces

""nrformats


"14 tabs and indenting

set tabstop=8

set shiftwidth=8

set smarttab

set softtabstop=4

""shiftround

set noexpandtab

"autoindent
"smartindent

set cindent

"set cinoptions=:0,t0,+4,(0
" +N : �������θ����Ȥ���Ǥ��礦���ɤ�
set cinoptions=:0,t0,+4,(0,)500,*500

""cinkeys
""cinwords
"indentexpr
"indentkeys
"copyindent
"preserveindent
""lisp
""lispwords


"15 folding

"foldenable
"foldlevel
"foldlevelstart
"foldcolumn
"foldtext
"foldclose
"foldopen
"foldminlines
"commentstring
"foldmethod
"foldexpr
"foldignore
"foldmarker
"foldnestmax


"16 diff mode
"diff
"diffopt
"diffexpr
"patchexpr


"17 mapping
"maxmapdepth
"remap
"timeout
"ttimeout
"timeoutlen
"ttimeoutlen


"18 reading and writing files

"modeline
"modelines
"binary
"endofline
"bomb
"fileformat

set fileformats=unix,dos,mac

""textmode
""textauto
""write
""writebackup

set backup

"backupskip
"backupcopy

"set backupdir=.,~/tmp,~/
set backupdir=~/.vim-backup

""backupext
"autowrite
"autowriteall
"writeany
"autoread
"patchmode
"fsync
"shortname
"cryptmethod


"19 the swap file

"set directory=.,/home/tak/tmp,/var/tmp,/tmp
set directory=~/.vim-backup

"swapfile
"swapsync
"updatecount
"updatetime
"maxmem
"maxmemtot


"20 command line editing

set history=200

"wildchar
"wildcharm

set wildmode=list,full

"set suffixes=.bak,~,.o,.h,.info,.swp,.obj
set suffixes-=.h,.swp

" gf, [I, etc...
set suffixesadd+=.java,.py,.rb

set wildignore+=.swp,

set wildmenu

"cedit
set cmdwinheight=10

"undofile
set undodir=.vimundo


"21 executing external commands

"sh����ꤷ�ʤ��Ƥ������ʤ�
"shell
""shellquote
""shellxquote
""shellcmdflag
""shellredir
""shelltemp
" gg =G
"set equalprg=indent\ -kr
" gq
"formatprg
" K, info����¾����Ѥ��Ƥ��ɤ�����
"keywordprg
""warn


"22 running make and jumping to errors

""errorfile
""errorformat

"makeprg
"set makeprg=nbmake-foobarmips

""shellpipe
"makeef
"grepprg
"grepformat


"23 language specific
"
""isfname
""isident
""iskeyword
""isprint
""quoteescape

""rightleft
""rightleftcmd
""revins
""allowrevins
""aleph
""hkmap
""hkmapp
""altkeyma
""fkmap
""arabic
""arabicshape
""termbidi

""keymap
""langmap

"iminsert
"�ְ㤨�Ƥ���äݤ�
"map <silent> <ESC> <ESC>:set iminsert=0<CR>

"imsearch


"24 multi-byte characters
"
" related:
"   ++enc   : fileencoding
"   ++bad   : fileencodings
"   ++ff    : fileformat
"   ++bin   : binary
"   ++nobin : nobinary
"
" e ++ff={unix,dos.mac}
" e ++enc={utf-8,euc-jp,...}
" B
" w ++enc={utf-8,euc-jp,...} filename

set encoding=japan
if has('iconv')
	if has('guess_encode')
		set fileencodings=guess,ucs-bom
	else
		set fileencodings=ucs-bom
	endif
	set fileencodings+=ucs-2le,ucs-2
	set fileencodings+=iso-2022-jp-3
	if &encoding !=? 'utf-8'
		set fileencodings+=utf-8
	endif
	if &encoding !=? 'cp932'
		set fileencodings+=cp932
	endif
	if &encoding !=? 'euc-jp' && &encoding !=? 'euc-jisx0213'
		set fileencodings+=euc-jisx0213,euc-jp
	endif
endif


" default : current locale
"encoding

"fileencoding
"fileencodings
"termencoding
"charconvert

"delcombine
"maxcombine

"ambiwidth
"set ambiwidth=double


"25 various
"virtualedit
""eventignore
""loadplugins
""exrc
""secure
""gdefault
""edcompatible
""maxfuncdepth
"sessionoptions
"viewoptions
""viewdir
"viminfo
"bufhidden
"buftype
""buflisted
""debug

"-----------------------------------------------------------------------------

colorscheme slate


" ���ѥ��ڡ�����Ĵ
highlight ZenkakuSpace guibg=white
highlight ZenkakuSpace ctermbg=white
match ZenkakuSpace /��/


" ToDo: ���Ѥ���plugin������

" format.vim : ���ܸ�����������ץ��Ѥ�����
let format_allow_over_tw = 1	" �֤鲼���ǽ��


" showmarks http://www.vim.org/script.php?script_id=152
let g:showmarks_enable=0
let g:showmarks_textlower="\t>"
let g:showmarks_textupper="\t>"
let g:showmarks_textother="\t>"

highlight ShowMarksHLl ctermfg=blue ctermbg=black guifg=red guibg=green
highlight ShowMarksHLu ctermfg=blue ctermbg=black guifg=red guibg=green
highlight ShowMarksHLo ctermfg=blue ctermbg=black guifg=red guibg=green
highlight ShowMarksHLm ctermfg=blue ctermbg=black guifg=red guibg=green

" Toggles ShowMarks on and off (require "showmarks.vim")
"nmap <F12> :ShowMarksToggle<CR>
"imap <F12> <C-O>:ShowMarksToggle<CR>


" clipboard ̵̾�쥸����������ǡ����� *�쥸�����ˤ������
" set clipboard+=unnamed


" vimcommander
" noremap <silent> <F11> :cal VimCommanderToggle ()<CR>

