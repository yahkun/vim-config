
" Plugin Settings
"---------------------------------------------------------

if dein#tap('denite.nvim')
	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh -mode=normal<CR>
	nnoremap <silent><LocalLeader>f :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file/old -default-action=switch<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Denite grep -buffer-name=search -no-empty -mode=normal<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point -mode=normal<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Denite -buffer-name=tag tag:include<CR>
	nnoremap <silent><LocalLeader>p :<C-u>Denite jump -buffer-name=jump -mode=normal<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/books<CR>
	" nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z -buffer-name=jump<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Denite line -buffer-name=search -auto-highlight<CR>
	nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line -buffer-name=search -auto-highlight -mode=normal<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>

	" chemzqm/denite-git
	nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
	nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
	nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord tag:include -buffer-name=tag -immediately<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep -buffer-name=search<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -buffer-name=search grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction "}}}
endif

if dein#tap('vim-denite-z')
	command! -nargs=+ -complete=file Z
		\ call denite#start([{'name': 'z', 'args': [<q-args>], {'immediately': 1}}])
endif

if dein#tap('tagbar')
	nnoremap <silent> <Leader>o   :<C-u>TagbarOpenAutoClose<CR>
	" sort by sourcefile
	let g:tagbar_sort = 0

	" Also use h/l to open/close folds
	let g:tagbar_map_closefold = ['h', '-', 'zc']
	let g:tagbar_map_openfold = ['l', '+', 'zo']
	" for Tagbarbar, sudo apt-get install ctags
	nnoremap <silent> <F8> :TagbarToggle<CR>
	nnoremap <leader>t :TagbarToggle<CR>
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <Leader>f
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
endif

if dein#tap('nerdtree')
	let g:NERDTreeMapOpenSplit = 'sv'
	let g:NERDTreeMapOpenVSplit = 'sg'
	let g:NERDTreeMapOpenInTab = 'st'
	let g:NERDTreeMapOpenInTabSilent = 'sT'
	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
	let g:NERDTreeMapOpenRecursively = 't'
	let g:NERDTreeMapCloseChildren = 'T'
	let g:NERDTreeMapToggleHidden = '.'

	nnoremap <silent> <LocalLeader>e :<C-u>let NERDTreeWinPos=0 \| NERDTreeToggle<CR>
	nnoremap <silent> <LocalLeader>a :<C-u>let NERDTreeWinPos=0 \| NERDTreeFind<CR>
	nnoremap <silent> <LocalLeader>E :<C-u>let NERDTreeWinPos=1 \| NERDTreeToggle<CR>
	nnoremap <silent> <LocalLeader>A :<C-u>let NERDTreeWinPos=1 \| NERDTreeFind<CR>
endif

if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
endif

if dein#tap('emmet-vim')
	autocmd MyAutoCmd FileType html,css,jsx,javascript,javascript.jsx
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-operator-surround')
	map <silent>sa <Plug>(operator-surround-append)
	map <silent>sd <Plug>(operator-surround-delete)
	map <silent>sr <Plug>(operator-surround-replace)
	nmap <silent>saa <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
	nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
	nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-operator-flashy')
	map y <Plug>(operator-flashy)
	nmap Y <Plug>(operator-flashy)$
endif

if dein#tap('vim-niceblock')
	xmap I  <Plug>(niceblock-I)
	xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent>j <Plug>(accelerated_jk_gj)
	nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap <Leader>, <Plug>(quickhl-manual-this)
	xmap <Leader>, <Plug>(quickhl-manual-this)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-bookmarks')
	nmap ma :<C-u>cgetexpr bm#location_list()<CR>
		\ :<C-u>Denite quickfix -buffer-name=list<CR>
	nmap mn <Plug>BookmarkNext
	nmap mp <Plug>BookmarkPrev
	nmap mm <Plug>BookmarkToggle
	nmap mi <Plug>BookmarkAnnotate
endif

if dein#tap('auto-git-diff')
	autocmd MyAutoCmd FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('vim-peekaboo')
	nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
	xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
	nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
	inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('jedi-vim')
	let g:jedi#completions_command = ''
	let g:jedi#documentation_command = 'K'
	let g:jedi#goto_command = '<C-]>'
	let g:jedi#goto_assignments_command = '<leader>g'
	let g:jedi#rename_command = '<Leader>r'
	let g:jedi#usages_command = '<Leader>n'
endif

if dein#tap('tern_for_vim')
	autocmd MyAutoCmd FileType javascript,jsx,javascript.jsx
		\  nnoremap <silent><buffer> K          :<C-u>TernDoc<CR>
		\| nnoremap <silent><buffer> <C-]>      :<C-u>TernDefSplit<CR>
		\| nnoremap <silent><buffer> <leader>g  :<C-u>TernType<CR>
		\| nnoremap <silent><buffer> <leader>n  :<C-u>TernRefs<CR>
		\| nnoremap <silent><buffer> <leader>r  :<C-u>TernRename<CR>
endif

if dein#tap('vim-gitgutter')
	nmap <Leader>hj <Plug>GitGutterNextHunk
	nmap <Leader>hk <Plug>GitGutterPrevHunk
	nmap <Leader>hs <Plug>GitGutterStageHunk
	nmap <Leader>hr <Plug>GitGutterUndoHunk
	nmap <Leader>hp <Plug>GitGutterPreviewHunk
endif

if dein#tap('vim-go')
	" for golang https://github.com/fatih/vim-go https://github.com/fatih/vim-go-tutorial
	let g:go_fmt_command = "goimports"
	set autowrite
	autocmd FileType go nmap <C-b> <Plug>(go-build)
	" autocmd FileType go nmap <C-e> <Plug>(go-run)
	autocmd FileType go nmap <C-i> <Plug>(go-imports)
	" let g:go_list_type = "quickfix"
	let g:go_auto_type_info = 1
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
	let g:go_metalinter_autosave_enabled = ['golint']
	let g:go_metalinter_autosave = 1
	let g:go_def_mode = 'godef'  " gopls faster than guru

	autocmd MyAutoCmd FileType go
		\   nmap <C-]> <Plug>(go-def)
		\ | nmap <Leader>god  <Plug>(go-describe)
		\ | nmap <Leader>goc  <Plug>(go-callees)
		\ | nmap <Leader>goC  <Plug>(go-callers)
		\ | nmap <Leader>goi  <Plug>(go-info)
		\ | nmap <Leader>gom  <Plug>(go-implements)
		\ | nmap <Leader>gos  <Plug>(go-callstack)
		\ | nmap <Leader>goe  <Plug>(go-referrers)
		\ | nmap <Leader>gor  <Plug>(go-run)
		\ | nmap <Leader>gov  <Plug>(go-vet)
endif

if dein#tap('phpcomplete-extended')
	autocmd MyAutoCmd FileType php
		\   nmap <silent> <unique> K <Plug>(phpcomplete-extended-doc)
		\ | nmap <silent> <unique> <C-]> <Plug>(phpcomplete-extended-goto)
		\ | nmap <silent> <unique> <Leader>a <Plug>(phpcomplete-extended-add-use)
endif

if dein#tap('vimagit')
	nnoremap <silent> mg :Magit<CR>
endif

if dein#tap('vim-easygit')
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gD :Gdiffoff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gB :Gbrowse<CR>
	nnoremap <silent> <leader>gS :Gstatus<CR>
	nnoremap <silent> <leader>gp :Gpush<CR>
endif

if dein#tap('vim-altr')
	nmap gs  <Plug>(altr-forward)
	nmap gS  <Plug>(altr-back)
endif

if dein#tap('open-browser.vim')
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('vim-online-thesaurus')
	nnoremap <silent> <Leader>K :<C-u>OnlineThesaurusCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> m" :SidewaysJumpLeft<CR>
	nnoremap <silent> m' :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap ,df :Linediff<CR>
	vnoremap ,da :LinediffAdd<CR>
	nnoremap ,ds :<C-u>LinediffShow<CR>
	nnoremap ,dr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('caw.vim')
	function! InitCaw() abort
		if ! &l:modifiable
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		else
			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		endif
	endfunction
	autocmd MyAutoCmd FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('vim-easymotion')
	map <Leader><Leader>w <Plug>(easymotion-w)
	map <Leader><Leader>f <Plug>(easymotion-f)
	map <Leader><Leader>b <Plug>(easymotion-b)
	nmap ss <Plug>(easymotion-s2)
	nmap sd <Plug>(easymotion-s)
	nmap sf <Plug>(easymotion-overwin-f)
	map  sh <Plug>(easymotion-linebackward)
	map  sl <Plug>(easymotion-lineforward)
	" map  sj <Plug>(easymotion-j)
	" map  sk <Plug>(easymotion-k)
	map  s/ <Plug>(easymotion-sn)
	omap s/ <Plug>(easymotion-tn)
	map  sn <Plug>(easymotion-next)
	map  sp <Plug>(easymotion-prev)
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

if dein#tap('incsearch.vim')
	" fuzzy search with z/  (ch:模糊搜索，使用z/支持模糊搜索)
	map z/ <Plug>(incsearch-fuzzy-/)
	map z? <Plug>(incsearch-fuzzy-?)
	map zg/ <Plug>(incsearch-fuzzy-stay)
endif

if dein#tap('vim-pydocstring')
	nmap <silent> <C-d> <Plug>(pydocstring)
endif

if dein#tap('python-mode')
	" 注意如果使用了 rope 一般是项目根目录打开文件，不要切到子目录
	" set noautochdir 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
	" 如果你发现找不到你的 package 或者系统的，编辑你的代码根目录下 .ropeproject/config.py 里的文件就可以了
	" 比如加上 prefs.add('python_path', '/usr/local/lib/python2.7/site-packages/') 就可以找到系统包了

	" when PYTHON_VERSION env variable is set, use python2. default Use python3
	" ch: 如果设置了 export PYTHON_VERSION=2 环境变量使用 python2 ，否则默认 python3
	if $PYTHON_VERSION == '2'
		let g:pymode_python = 'python'  " Values are `python`, `python3`, `disable`.
	else
		let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
	endif
	let g:pymode_paths = reverse(split(globpath(getcwd().'/eggs', '*'), '\n'))    " support zc.buildout
	let g:pymode_trim_whitespaces = 1
	let g:pymode_quickfix_maxheight = 3
	let g:pymode_indent = 1
	let g:pymode_folding = 1
	let g:pymode_breakpoint = 1
	let g:pymode_breakpoint_bind = "<C-d>"  " NOTE: use ctrl+d insert ipdb
	let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # BREAKPOINT TODO REMOVE; from nose.tools import set_trace; set_trace()'

	let g:pymode_run = 1
	let g:pymode_run_bind = "<C-e>"
	let g:pymode_virtualenv = 1
	let g:pymode_virtualenv_path = $VIRTUAL_ENV

	" Override view python doc key shortcut to Ctrl-Shift-d
	let g:pymode_doc=1
	let g:pymode_doc_bind = 'K'

	autocmd CompleteDone * pclose
	autocmd FileType python setlocal omnifunc=RopeCompleteFunc
	" WARNING: rope complete conflict with jedi, choose one of them
	let g:pymode_rope = 1
	let g:pymode_rope_autoimport = 0
	let g:pymode_rope_complete_on_dot = 0
	let g:pymode_rope_lookup_project = 0
	let g:pymode_rope_goto_definition_bind = "<C-]>"
	let g:pymode_rope_goto_definition_cmd = 'vnew'
	let g:pymode_rope_regenerate_on_write = 0
	command PR PymodeRopeRegenerate

	let g:pymode_lint = 1
	let g:pymode_lint_on_write = 1
	let g:pymode_lint_on_fly = 0
	let g:pymode_lint_message = 1
	let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
	let g:pymode_lint_ignore = ["C0103, C0111, C0301, C0304, C0325, E0702, E1120, R0201, R0903, R0911, R0912, R0913, R1705, W0105, W0108, W0110, W0201, W0221, W0223, W0235, W0403, W0511, W0622, W0703, W1202"]
	let g:pymode_lint_options_mccabe = { 'complexity': 15 }
	let g:pymode_lint_signs = 1
	" if you want use emoji you shoud set : Iterm2->Profiles->Text->Use Unicode versoin 9 widths
	let g:pymode_lint_todo_symbol = '😡'
	" let g:pymode_lint_error_symbol = '❌'
	" let g:pymode_lint_comment_symbol = '😢'
	" let g:pymode_lint_comment_symbol = "❗"
	let g:pymode_lint_error_symbol = "\U2717"
	let g:pymode_lint_comment_symbol = "\u2757"
	let g:pymode_lint_visual_symbol = "\u0021"

	" 修改默认的红线为浅色，solorized黑色主题
	highlight ColorColumn ctermbg=233
	let g:pymode_lint_cwindow = 0
	let g:pymode_options_max_line_length = 120
	let g:pymode_options_colorcolumn = 1
	" 指定UltiSnips python的docstring风格, sphinx, google, numpy
	let g:ultisnips_python_style = 'sphinx'
	" http://stackoverflow.com/questions/16021297/how-to-map-alias-a-command-in-vim, PymodeLint映射成PL
	command PL PymodeLint
	command PA PymodeLintAuto    " auto fix pep8
	noremap <leader>p :Neoformat<cr>  " normal mode use leader(,)+p autopep8 format code
endif

if dein#tap('InstantRst')
	" rst书写插件
	let proj1 = { 'path': '~/Program/doc/python-web-guide',}
	let g:riv_projects = [proj1]
endif

if dein#tap('ctrlp.vim')
	" ctrlp, 在~/.agignore添加一行node_modules
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
		\ }
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	if executable('ag')
		" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
		set grepprg=ag\ --nogroup\ --nocolor
		" Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
		" and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
	else
		"ctrl+p ignore files in .gitignore
		let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
	endif
endif

if dein#tap('scss-syntax.vim')
	"http://vimawesome.com/plugin/scss-syntax-vim
	au BufRead,BufNewFile *.scss set filetype=scss.css
endif

if dein#tap('rainbow_parentheses.vim')
	"http://vimawesome.com/plugin/rainbow-parentheses-vim   花里胡哨的彩虹括号^_^
	"http://www.wklken.me/posts/2015/06/07/vim-plugin-rainbowparentheses.html
	let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]

	" 不加入这行, 防止黑色括号出现, 很难识别
	" \ ['black',       'SeaGreen3'],

	let g:rbpt_max = 16
	let g:rbpt_loadcmd_toggle = 0
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
endif

if dein#tap('vim-interestingwords')
	" https://github.com/lfv89/vim-interestingwords 高亮感兴趣的 word
	nnoremap <silent> <leader>f :call InterestingWords('n')<cr>
	nnoremap <silent> <leader>F :call UncolorAllWords()<cr>
endif

if dein#tap('vim-startify')
	" 禁止 startify 自动切换目录
	let g:startify_change_to_dir = 0
endif

if dein#tap('vim-youdao-translater')
	" https://github.com/ianva/vim-youdao-translater settings
	vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
	nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
	noremap <leader>yd :<C-u>Yde<CR>
endif

if dein#tap('toggle-numbers.vim')
	" Plugin 'fullybaked/toggle-numbers.vim'
	nmap ,n :LineNumberToggle<cr>
	nnoremap <C-m> :LineNumberToggle<cr>
endif


if dein#tap('vim-airline')
	" for airline
	let g:airline_powerline_fonts=1
	let g:airline_theme = 'wombat'
	let g:airline#extensions#tabline#enabled = 1
	function! ArilineInit()
			let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
			let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
			"let g:airline_section_c = airline#section#create(['filetype'])
			let g:airline_section_x = airline#section#create(['%P'])
			let g:airline_section_y = airline#section#create(['%B'])
			let g:airline_section_z = airline#section#create_right(['%l', '%c'])
	endfunction
	autocmd VimEnter * call ArilineInit()
endif


if dein#tap('indentLine')
	let g:indentLine_enabled = 1
	" autocmd FileType * IndentLinesEnable
	" autocmd VimEnter,BufEnter,BufRead,BufWinEnter,WinEnter,BufNewFile,TabEnter * IndentLinesEnable
endif


if dein#tap('neoformat')
	let g:neoformat_try_formatprg = 1
  " pip install --upgrade autopep8
	let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['--max-line-length 140', '-'],
            \ 'stdin': 1,
            \ }
	let g:neoformat_enabled_python = ['autopep8']

	" yarn global add prettier@1.12.1  or  npm install --save-dev prettier@1.12.1
	" note must use prettier specific version
	" https://github.com/prettier/prettier/blob/master/docs/vim.md
	autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 120\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
	let g:neoformat_enabled_javascript = ['prettier']
endif


if dein#tap('editorconfig-vim')
	let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif


if dein#tap('vim-multiple-cursors')
	" https://github.com/Shougo/deoplete.nvim/blob/master/doc/deoplete.txt
	function g:Multiple_cursors_before()
		let g:deoplete#disable_auto_complete = 1
	endfunction
	function g:Multiple_cursors_after()
		let g:deoplete#disable_auto_complete = 0
	endfunction
endif


if dein#tap('vim-polyglot')
	let g:polyglot_disabled = ['javascript', 'jsx', 'javascript.jsx']
endif


if dein#tap('MatchTagAlways')
	" https://speakerdeck.com/jwworth/react-dot-js-plus-vim?slide=35
	let g:mta_filetypes = {
    \ 'javascript.jsx' : 1,
    \}
endif

" vim: set ts=2 sw=2 tw=80 noet :
