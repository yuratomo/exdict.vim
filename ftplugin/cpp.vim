" FILE: ftplugin/cpp.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
if exists('b:loaded_exdict_ftplugin_cpp')
  finish
endif

let b:dict_files = [ 'dict/ms_c.dict' ]

if !exists('g:exdict#disable_win32_api') || g:exdict#disable_win32_api == 0
  call add(b:dict_files, 'dict/win32_api.dict')
endif

if !exists('g:exdict#disable_mfc') || g:exdict#disable_mfc == 0
  call add(b:dict_files, 'dict/mfc.dict')
endif

let b:loaded_exdict_ftplugin_cpp = 0
