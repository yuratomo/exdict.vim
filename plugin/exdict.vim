" file: plugin/exdict.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.05.02
" Version: 0.6.1

if exists('g:loaded_exdict') && g:loaded_exdict == 1
  finish
endif

let g:exdict#list = []
call add(g:exdict#list, {'name':'c',           'file':'dict/ms_c.dict'})
call add(g:exdict#list, {'name':'win32api',    'file':'dict/win32_api.dict'})
call add(g:exdict#list, {'name':'mfc',         'file':'dict/mfc.dict'})
call add(g:exdict#list, {'name':'winddk',      'file':'dict/win_kernel_api.dict'})
call add(g:exdict#list, {'name':'kmdf',        'file':'dict/win_kmdf.dict'})
call add(g:exdict#list, {'name':'j2se6',       'file':'dict/j2se6.0.dict'})
call add(g:exdict#list, {'name':'php',         'file':'dict/php.dict'})
call add(g:exdict#list, {'name':'posix',       'file':'dict/posix.dict'})
call add(g:exdict#list, {'name':'wpf',         'file':'dict/wpf.dict'})
call add(g:exdict#list, {'name':'stl',         'file':'dict/stl.dict'})
call add(g:exdict#list, {'name':'.net.system', 'file':'dict/.net.system.dict'})

nnoremap <Plug>(exdict-prev-i) :<C-u>call exdict#ShowRef(-1,'a')<CR>
nnoremap <Plug>(exdict-next-i) :<C-u>call exdict#ShowRef(1,'a')<CR>
nnoremap <Plug>(exdict-prev-n) :<C-u>call exdict#ShowRef(-1,'')<CR>
nnoremap <Plug>(exdict-next-n) :<C-u>call exdict#ShowRef(1,'')<CR>
inoremap <expr> <Plug>(exdict-omni-complete) exdict#OmniCompletion()

command! -nargs=* -complete=customlist,exdict#DictList Exdict :call exdict#LoadExdict(<f-args>)

let g:loaded_exdict = 1
