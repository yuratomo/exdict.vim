" FILE: syntax/java.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
if exists('b:loaded_exdict_syntax_java')
  finish
endif

let b:dict_list = []
let dict_list = [ 'dict/j2se6.0.dict' ]

for dict in dict_list
  for file in split(globpath(&runtimepath, dict), '\n')
    let &l:dictionary = &l:dictionary . ',' . file
    call add(b:dict_list, file)
    call exdict#LoadSyntaxFromDict(file, 'exdict_java')
  endfor
endfor

let b:loaded_exdict_syntax_java = 0
