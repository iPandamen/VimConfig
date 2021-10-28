"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","                 " 定义<leader>键
set nocompatible                    " 设置不兼容原始vi模式
filetype on                         " 设置开启文件类型侦测
filetype plugin on                  " 设置加载对应文件类型的插件
set noeb                            " 关闭错误的提示
syntax enable                       " 开启语法高亮功能
syntax on                           " 自动语法高亮
set t_Co=256                        " 开启256色支持
set cmdheight=2                     " 设置命令行的高度
set showcmd                         " 在命令模式下，在底部显示当前键入的命令
set showmode                        " 在底部显示当前的模式
set ruler                           " 在状态栏显示光标的当前位置（位于哪一行哪一列）

" TextEdit might fail if hidden is not set.
set hidden

" Statusline
set laststatus=2    " 是否显示状态栏，‘0’表示不显示，‘1’表示只在多窗口时显示，‘2’表示显示

" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲区被修改标记/只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替

set number                          " 开启行号显示

set cursorline                      " 高亮显示当前行
set cursorcolumn                    " 高亮显示当前列
set whichwrap+=<,>,h,l              " 设置光标键跨行
set ttimeoutlen=0                   " 设置<ESC>键响应时间
set virtualedit=block,onemore       " 允许光标出现在最后一个字符的后面



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                      " 设置自动缩进
set cindent                         " 设置使用 C/C++ 语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0         " 设置 C/C++ 语言的具体缩进方式
set smartindent                     " 智能的选择对齐方式
filetype indent on                  " 自适应不同语言的智能缩进
set expandtab                       " 将制表符扩展为空格
set tabstop=2                       " 设置编辑时制表符占用空格数
set shiftwidth=2                    " 设置格式化时制表符占用空格数
set softtabstop=2                   " 设置4个空格为制表符
set smarttab                        " 在行和段开始出使用制表符

" set wrap    " 自动折行，即太长的行分成几行显示
set nowrap    " 关闭自动折行

" 如果设置了 自动折行
if &wrap
    set sidescrolloff=0
    set linebreak   " 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说不会在单词内不折行
    set wrapmargin=2 " 指定折行处与编辑窗口的右边缘之间空出的字符数
else
    " 没有设置自动这行
    set sidescrolloff=15  " 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
    set wrapmargin=0
endif

set scrolloff=5 " 垂直滚动时，光标距离顶部/底部的位置（单位：行）

set backspace=2                     " 使用回车键正常处理indent,eol,start等
set sidescroll=10                   " 设置向右滚动字符数
set nofoldenable                    " 禁用折叠代码


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                        " vim自身命令行模式智能补全
set wildmode=longest:list,full

set completeopt-=preview            " 补全是不显示窗口，只显示补全列表


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch                       " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号，大括号
" set hlsearch                        " 高亮显示搜索结果
set nohlsearch                        
set incsearch                       " 开启实时搜索功能

" set ignorecase                    " 搜索时大小写不敏感
" set smartcase                     " 如果同时打开了 'ingorecase'，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况下都是大小写不敏感。比如搜索 'Test'时，将不匹配'test'；搜索'test'时，将不匹配'Test'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set backup
set nobackup                        " 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，他的文件名是在原文件名的末尾，在添加一个波浪号（～）
set nowritebackup
set noswapfile                      " 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是'.'、结尾时'.swap'.
set autoread                        " 文件在vim之外修改过，自动重新读入
set autowrite                       " 设置自动保存
set confirm                         " 在处理未保存或只读文件的时候，弹出确认
set undofile                        " 保留撤销历史
set autochdir                       " 自动切换工作目录。在一个Vim会话中打开多个文件的情况下，默认的工作目录是打开的第一个文件目录。该配置可以将工作目录自动切换到正在编辑的文件的目录。

set history=1000    " Vim 需要记住多少次历史操作


let s:vim_backup_dir=expand("~/.vim/.backup")
let s:vim_swp_dir=expand("~/.vim/.swp")
let s:vim_undo_dir=expand("~/.vim/.undo")

" 检测 ~/.vim/.backup 不存在就新建
if !isdirectory(s:vim_backup_dir)
    silent! call mkdir(s:vim_backup_dir,'p')
endif
" 检测 ~/.vim/.swp不存在就新建
if !isdirectory(s:vim_swp_dir)
    silent! call mkdir(s:vim_swp_dir,'p')
endif
" 检测 ~/.vim/.undo不存在就新建
if !isdirectory(s:vim_undo_dir)
    silent! call mkdir(s:vim_undo_dir,'p')
endif

" 设置备份文件、交换文件、操作历史文件的保存位置。
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/
set undodir=~/.vim/.undo/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置菜单栏和信息显示语言
set langmenu=en_US.UTF-8
"set langmenu=zh_CN.UTF-8
language message en_US.UTF-8

set helplang=cn

" 设置Vim内部编码方式 'encoding' 'enc'
set encoding=utf-8

" 设置vim的屏幕显示编码 'termencodeing' 'tenc'
set termencoding=utf-8
" 设置文件的编码方式
set fileencoding=utf-8
" 设置vim的解码列表 'fileencodings' 'fencs'
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

" if( has("termguicolors"))
"     set termguicolors
" endif

" colorscheme pants
" colorscheme dracula
" colorscheme dream
" colorscheme monokai
colorscheme onedark
" colorscheme tender

" set lazyredraw " redraw only when we need to



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    set guifont=Consolas:h10
    set lines=40 columns=120
    set guioptions-=m           " 隐藏菜单
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:block   " 设置光标为竖线/ 块状
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping seting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 重新加载 .vimrc 文件
nnoremap <leader>sv :w!<cr>:source $MYVIMRC<cr>

" 编辑 .vimrc 文件
nnoremap <leader>e : edit $MYVIMRC<cr>

" 添加 '"',''','(','[','{'
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel

" vim-buffer
nnoremap <silent> <c-p> :bnext<cr>
nnoremap <silent> <c-n> :bprevious<cr>
nnoremap <silent> <leader>d :bdelet<cr>

" 安装、更新、清理插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 
" autocmd cursorhold * set nohlsearch

" noremap n:set hlsearch
" noremap N:set hlsearch
" noremap /:set hlsearch
" noremap ?:set hlsearch
" noremap * *:set hlsearch
 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc_group
    autocmd!
    " 打开文件自动定位到最后编辑的位置
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug install
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/guns/xterm-color-table.vim'    " 256色颜色表
Plug 'vim-airline/vim-airline'      " 状态栏
Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'   " 自动补全
Plug 'neoclide/coc.nvim',{'branch':'master','do':'yarn install --frozen-lockfile'}

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'  " Comment
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'chiel92/vim-autoformat'
Plug 'rhysd/vim-clang-format'
Plug 'altercation/vim-colors-solarized'
Plug 'yegappan/taglist'
Plug 'vim-scripts/a.vim'
Plug 'Yggdroot/LeaderF', {'do': '.install.sh'}
call plug#end()




" ************************** @airline **************************
let g:airline#extensions#tabline#enabled = 1 " 是否打开tabline
let g:airline_powerline_fonts = 1
set laststatus=2


" ************************** nerdtree **************************
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
inoremap <silent> <leader>n <esc>:NERDTreeToggle<cr>


" ************************** Syntastic **************************
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLlineFlag()}
set statusline+=%*


" ************************** nerdcommenter **************************
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment-delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': {'left':'/**','right':'*/'}}
let g:NERDCustomDelimiters = { 'c': {'left':'//','right':''}}
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Default mappings
" [count]<leader>cc |NERDCommenterComment|
"     Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDCommenterNested|
"     Same as cc but forces nesting.
" [count]<leader>c<space> |NERDCommenterToggle|
"     Toggles the comment state of the selected line(s). If the topmost selected line is commented ,all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDCommenterMinimal|
"     Comments the given lines using only one set of multipart delimites.
" [count]<leader>ci |NERDCommenterInvert|
"     Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDCommenterSexy|
"     Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDCommenterYank|
"     Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDCommentedToEOL|
"     Comments the current line from the cursor to the end of line.
" <leader>cA |NERDCommenterAppend| "
"     Adds comment delimiters to the end of line and goes into insert mode between them.
" |NERDCommenterinsert|
"     Adds comment delimiters at the current cursor position and inserts between.Disabled by default.
" <leader>ca |NERDCommenterAltDelims|
"     Switches to the alternative set of delimiters.
" [count]<leader>cl |NERDCommenterAlignLeft| [count]<leader>cb |NERDCommenterAlignBoth|
"     Same as |NERDCommenterComment| except that the delimiters are aligned down the left side(<leader>cl or both sides (<leader>cb).
" [count]<leader>cu |NERDCommenterUncomment|
"     Uncomments the selected line(s).

" *********************** gutentags ***********************
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root','.svn','.git','.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中,避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags,'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS','--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']



" ************************** Emmet **************************
" let g:user_emmet_mode='n'       " only enable normal mode functions.
" let g:user_emmet_mode='inv'     " enable all functions which is eaual to
let g:user_emmet_mode='a'       " enable all functions in all mode.

" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Redefine trigger key
" let g:user_emet_leader_key = '<c-y>'



" ************************** vim-autoformat **************************
" F3 自动化格式代码
noremap <F3> :Autoformat<cr>
" let g:autoformat_verbosemode=1
" 保存时自动格式化代码，针对所支持的文件
" au BufWrite * :Autoformat
"


" **************************************************************
" ************************** coc.nvim **************************
" **************************************************************

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" ************************** coc-highlight **************************
autocmd CursorHold * silent call CocActionAsync('highlight')




