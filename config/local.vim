" Write buffer (save)
imap ,w <esc>:w<CR>

" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" shortcuts to vimdiff, http://stackoverflow.com/questions/7309707/why-does-git-mergetool-opens-4-windows-in-vimdiff-id-expect-3
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif


" change tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim
nnoremap tt :tab split<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" add :FormatJSON command, https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2))"
com! FormatJSONPy3 %!python3 -m json.tool
com! FormatJSONPy2 %!python -m json.tool
com! FormatJSONPy2Utf8 %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2)"

map <F4> :%retab! <CR> :w <CR>

" 退出快捷键
inoremap jj <Esc>`^
inoremap <C-j> <C-o>o
noremap <leader>e :q<cr>
noremap <leader>E :qa!<cr>
noremap <leader>b :bd<cr>

" omni Completion
inoremap <C-Space> <C-x><C-o>

" my own map config
set noautochdir    " 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
set signcolumn=no
