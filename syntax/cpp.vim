" FILE: syntax/cpp.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
if exists('b:loaded_exdict_syntax_cpp')
  finish
endif

let b:dict_list = []
let dict_list = [ 'dict/ms_c.dict' ]

if !exists('g:exdict#disable_win32_api') || g:exdict#disable_win32_api == 0
  call add(dict_list, 'dict/win32_api.dict')
endif

if !exists('g:exdict#disable_mfc') || g:exdict#disable_mfc == 0
  call add(dict_list, 'dict/mfc.dict')
endif

for dict in dict_list
  for file in split(globpath(&runtimepath, dict), '\n')
    let &l:dictionary = &l:dictionary . ',' . file
    call add(b:dict_list, file)
    call exdict#LoadSyntaxFromDict(file, 'exdict_cpp')
  endfor
endfor

let b:loaded_exdict_syntax_cpp = 0
