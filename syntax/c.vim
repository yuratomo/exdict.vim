" FILE: syntax/c.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
"
if exists('b:loaded_exdict_syntax_c')
  finish
endif

let b:dict_list = []
let dict_list = [ 'dict/ms_c.dict' ]

if !exists('g:exdict#disable_win32_api') || g:exdict#disable_win32_api == 0
  call add(dict_list, 'dict/win32_api.dict')
endif

if !exists('g:exdict#disable_win_kernel_api') || g:exdict#disable_win_kernel_api == 0
  call add(dict_list, 'dict/win_kernel_api.dict')
endif

if !exists('g:exdict#disable_win_kmdf') || g:exdict#disable_win_kmdf == 0
  call add(dict_list, 'dict/win_kmdf.dict' )
endif

for dict in dict_list
  for file in split(globpath(&runtimepath, dict), '\n')
    let &l:dictionary = &l:dictionary . ',' . file
    call add(b:dict_list, file)
    call exdict#LoadSyntaxFromDict(file, 'exdict_c')
  endfor
endfor

let b:loaded_exdict_syntax_c = 0
