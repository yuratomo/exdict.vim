" FILE: plugin/exdict.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0

if exists('g:loaded_exdict') && g:loaded_exdict == 1
  finish
endif

nnoremap <Plug>(exdict-prev-i) :<C-u>call exdict#ShowRef(-1,'a')<CR>
nnoremap <Plug>(exdict-next-i) :<C-u>call exdict#ShowRef(1,'a')<CR>
nnoremap <Plug>(exdict-prev-n) :<C-u>call exdict#ShowRef(-1,'')<CR>
nnoremap <Plug>(exdict-next-n) :<C-u>call exdict#ShowRef(1,'')<CR>

let g:loaded_exdict = 1
