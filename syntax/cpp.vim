" FILE: syntax/cpp.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
if exists('b:loaded_exdict_syntax_cpp')
  finish
endif

let b:dict_list = []
let dict_list = [
\  'dict/ms_c.dict',
\  'dict/win32_api.dict' ]

for dict in dict_list
  for file in split(globpath(&runtimepath, dict), '\n')
    let &l:dictionary = &l:dictionary . ',' . file
    call add(b:dict_list, file)
    call exdict#LoadSyntaxFromDict(file, 'exdict_cpp')
  endfor
endfor

if !exists('g:exdict#disable_default_keymap') || g:exdict#disable_default_keymap == 0
  imap <buffer><c-UP>   <ESC><Plug>(exdict-next-i)
  imap <buffer><c-DOWN> <ESC><Plug>(exdict-prev-i)
  nmap <buffer><c-UP>   <Plug>(exdict-next-n)
  nmap <buffer><c-DOWN> <Plug>(exdict-prev-n)
endif

let b:loaded_exdict_syntax_cpp = 0
