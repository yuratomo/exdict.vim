" FILE: ftplugin/c.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
"
if exists('b:loaded_exdict_ftplugin_c')
  finish
endif

let b:dict_files = [ 'dict/ms_c.dict' ]

if !exists('g:exdict#disable_win32_api') || g:exdict#disable_win32_api == 0
  call add(b:dict_files, 'dict/win32_api.dict')
endif

if !exists('g:exdict#disable_win_kernel_api') || g:exdict#disable_win_kernel_api == 0
  call add(b:dict_files, 'dict/win_kernel_api.dict')
endif

if !exists('g:exdict#disable_win_kmdf') || g:exdict#disable_win_kmdf == 0
  call add(b:dict_files, 'dict/win_kmdf.dict' )
endif

let b:loaded_exdict_ftplugin_c = 0
