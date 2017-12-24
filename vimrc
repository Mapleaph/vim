" enable pathogen plugin 
execute pathogen#infect()

if (has("gui_running"))
        set guifont=Source\ Code\ Pro:h11
        " 平滑字体
        set antialias 
        " 不显示滚动条
        set guioptions-=r
endif

" 设置帮助文档为中文，需要 vimcdoc 子模块的支持
set helplang=cn

" for powerline status bar
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
" 启动显示状态行(1)，总是显示状态行(2)
set laststatus=2 
set t_Co=256

" taglist
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 使用 vi 非兼容模式
set nocompatible

" 设置命令行行高，默认是 1
set cmdheight=2

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 命令/文件名自动补全
set wildmenu
set wildmode=longest:full,full

" 语法高亮
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
syntax on

" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile * setfiletype txt

"set backspace=2

" 设置光标随鼠标移动
set mouse=a
" 选择时不包含当前光标所在字符
set selection=exclusive
"set selectmode=mouse,key

" 设置配色方案
"colorscheme torte
"colorscheme murphy
"colorscheme desert
"colorscheme elflord
"colorscheme ron
colorscheme dracula

" disable annoying error message when using YCM
" Value Error: Still no compile flags, no completion yet.
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 可视模式下 Ctrl+c 复制
vmap <C-c> "*y
" 普通模式下 Ctrl+y 粘贴
map <C-y> "*p

" 删除行末空白符
"nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"nnoremap <F8> :let _s=@/<Bar>:%s/;\s\+$/;/e<Bar>:let @/=_s<Bar><CR>
" better way
" use :call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
" define a command to simplify the call
" just use :TrimWhitespace
command! TrimWhitespace call TrimWhitespace()
" or even simpler, use \+w
noremap <Leader>w :call TrimWhitespace()<CR>

" 共享剪贴板
set clipboard+=unnamed
" 显示行号
set number
" 搜索忽略大小写
set ignorecase
" 高亮显示匹配的括号
set showmatch
" 设置键入闭合括号后，反向高亮开始括号后返回闭合括号的延迟时间，以十分之一秒为单位。
set matchtime=5
" 搜索跟随输入逐个字符高亮
set hlsearch
set incsearch

set whichwrap+=<,>,[,]

" 设置当文件被改动时自动载入
set autoread

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"set copyindent
set autoindent
set cindent
set tabstop=8
set shiftwidth=8
" 用空格代替制表符
set expandtab
" 在行和段的开始处使用制表符
set smarttab
" 为 C 程序提供自动缩进
set smartindent

" 在被分割的窗口间添加空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 1 line yanked, 2 lines deleted message displayed
set report=0

" 显示行号
set number

" 从不备份
set nobackup
" 突出显示当前行
set cursorline

" 不生成临时文件
set noswapfile

" 历史记录数
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Michael Wu")
		call append(line(".")+2, "\# mail: mapleaph@gmail.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/bin/sh")
		call append(line(".")+6, "")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: Michael Wu")
		call append(line(".")+2, "	> Mail: mapleaph@gmail.com ")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc

