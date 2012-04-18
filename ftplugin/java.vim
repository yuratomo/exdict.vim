" FILE: ftplugin/java.vim
" AUTHOR:  yuratomo
" Last Modified: 2012.04.15
" Version: 0.1.0
if exists('b:loaded_exdict_ftplugin_java')
  finish
endif

if !exists('g:exdict#disable_default_keymap') || g:exdict#disable_default_keymap == 0
  imap <buffer><c-DOWN>  <ESC><Plug>(exdict-next-i)
  imap <buffer><c-UP>    <ESC><Plug>(exdict-prev-i)
  nmap <buffer><c-DOWN>  <Plug>(exdict-next-n)
  nmap <buffer><c-UP>    <Plug>(exdict-prev-n)
endif

let b:loaded_exdict_ftplugin_java = 0
