" File: autoload/exdict.vim
" Last Modified: 2012.05.02
" Author: yuratomo (twitter @yusetomo)
"
function! exdict#DictList(A, L, P)
  let items = []
  for item in g:exdict#list
    if item.name =~ '^'.a:A
      call add(items, item.name)
    endif
  endfor
  return items
endfunction

function! exdict#LoadExdict(...)
  if !exists('b:dict_list')
    let b:dict_list = []
  endif

  let exist_dict = 0
  for dict in g:exdict#list
    if index(a:000, dict.name) == -1
      continue
    endif
    let exist_dict = 1
    for file in split(globpath(&runtimepath, dict.file), '\n')
      if index(b:dict_list, file) == -1
        "let &l:dictionary = &l:dictionary . ',' . file
        call add(b:dict_list, file)
        call s:LoadSyntaxFromDict(file, 'exdict')
      endif
    endfor
  endfor
  if exist_dict == 0
    echoerr 'no dictionary...'
    return
  endif
  if !exists('g:exdict#disable_default_keymap') || g:exdict#disable_default_keymap == 0
    imap <buffer><c-DOWN>  <ESC><Plug>(exdict-next-i)
    imap <buffer><c-UP>    <ESC><Plug>(exdict-prev-i)
    nmap <buffer><c-DOWN>  <Plug>(exdict-next-n)
    nmap <buffer><c-UP>    <Plug>(exdict-prev-n)
    imap <buffer><c-j>     <Plug>(exdict-omni-complete)
  endif
endfunction

function! s:LoadSyntaxFromDict(file, name)
  exe 'syn keyword ' . a:name . ' ' . join(map(readfile(a:file, ''), ' substitute(v:val, "(.*$", "", "") '), ' ')
  exe 'hi default link ' . a:name . ' Function'
endfunction

function! s:UpdateRef(last_feed_keys)
  if !exists('b:dict_list')
    return -1
  endif

  let line = getline('.')
  let fmd = stridx(line, '(')
  if fmd != -1 && a:last_feed_keys != ''
    let lmd = strridx(line, '(', col('.'))
    if lmd == -1 && fmd == lmd
      let keyword = substitute(substitute(line, '(.*$', '', ''), ".*\\W", '','') . '('
    else
      let lmd = strridx(line, '(', lmd-1) + 1
      let keyword = substitute(substitute(line[ lmd : ], '(.*$', '', ''), ".*\\W", '','') . '('
    endif
  else
    let keyword = '\<'.expand('<cword>')
  endif
  if exists('b:last_keyword') && b:last_keyword == keyword
    return 0
  endif
  let b:last_keyword = keyword

  let dict_files = join(b:dict_list, ' ')
  let cmd = &grepprg . ' "' . keyword . '" ' . dict_files
  let b:func_def_list = split(system(cmd), "\n")
  let b:msg_adjust = - 4 - strlen(len(b:func_def_list))*2 - 12
  return 1
endfunction

function! exdict#ShowRef(direct,last_feed_keys)
  while 1
    let direct = a:direct
    let ret = s:UpdateRef(a:last_feed_keys)
    if ret == -1
      break
    elseif ret == 1
      let direct = 0
    endif
    if len(b:func_def_list) <= 0
      echo 'no match item.'
      break
    endif

    let updateSubItem = 0
    if direct > 0 
      if b:subIndex == b:subItemNum -1
        let b:subIndex = 0
        if b:index < len(b:func_def_list) - 1
          let b:index = b:index + 1
          let updateSubItem = 1
        endif
      else
        let b:subIndex = b:subIndex + 1
      endif
    elseif direct < 0
      if b:subIndex == 0
        "let b:subIndex = xxx " can not resolve here.
        if b:index > 0
          let b:index = b:index - 1
          let updateSubItem = 1
        endif
      else
        let b:subIndex = b:subIndex - 1
      endif
    else
      let b:index = 0
      let updateSubItem = 1
      let b:subIndex = 0
    endif
    if a:last_feed_keys != ''
      call exdict#change_cmdheight()
    endif

    let max_ref_size = &columns + b:msg_adjust
    if updateSubItem == 1
      let parts = split(b:func_def_list[b:index], ':')
      let b:subItem = parts[len(parts) - 1]
      let b:subItemNum = strlen(b:subItem) / max_ref_size + 1
      if direct < 0
        if b:subIndex == 0
          let b:subIndex = b:subItemNum - 1  " resolve here
        endif
      endif
    endif

    let idx = b:index+1
    if b:subIndex >= b:subItemNum - 1
      let ref = strpart(b:subItem, b:subIndex*max_ref_size)
    else
      let ref = strpart(b:subItem, b:subIndex*max_ref_size, max_ref_size) 
    endif
    echom '('.idx.'/'.len(b:func_def_list).') '.ref
    redraw
    break
  endwhile

  if a:last_feed_keys != ''
    call feedkeys(a:last_feed_keys, 'n')
    " vim's bug? cursor don't redraw...
    call feedkeys(" ", 'n')
    call feedkeys("\<BS>", 'n')
  endif
endfunction

function! exdict#change_cmdheight()
  if &cmdheight < 2
    let b:cmdheight_backup = &cmdheight
    let b:updatetime_backup = &updatetime
    let &cmdheight = 2
    let &updatetime = 100
    au! CursorHold <buffer> call exdict#restore_cmdheight()
  endif
endfunction

function! exdict#restore_cmdheight()
  au! CursorHold <buffer>
  if exists('b:updatetime_backup')
    let &updatetime = b:updatetime_backup
    let &cmdheight = b:cmdheight_backup
    unlet b:updatetime_backup
    unlet b:cmdheight_backup
  endif
endfunction

function! exdict#CompleteFromDict(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    let res = []
    for dict in b:exdict_candidate
      let parts = split(dict, ':')
      let info = parts[len(parts) - 1]
      let type = 'f'
      if stridx(info, '(') == -1
        let type = 'm'
      endif
      let funcname = substitute(info, "[( ].*$", "", "")
      "let menu = substitute(info, "^.*#", "#", "")
      let menu = substitute(info, "^.*(", "(", "")
      if strlen(menu) > 40
        let menu = menu[ : 40]
      endif
      if funcname =~ '^' . a:base
        let item = { 
        \ 'word' : funcname,
        \ 'abbr' : '',
        \ 'menu' : menu,
        \ 'info' : info,
        \ 'kind' : type,
        \ 'icase': 0,
        \ 'dup'  : '0',
        \ 'empty': '0'}
        call add(res, item)
      endif
    endfor
    return res
  endif
endfunction

function! exdict#OmniCompletion()
  let first = 0
  if !exists('b:exdict_tag')
    let b:exdict_tag = ''
    let first = 1
  endif
  let tag = input('input keyword:', b:exdict_tag)
  if tag == ''
    let tag = '*'
  endif
  if tag !=# b:exdict_tag || first == 1
    let dict_files = join(b:dict_list, ' ')
    let cmd = &grepprg . ' "' . tag . '" "' . dict_files . '"'
    let b:exdict_candidate = split(system(cmd), "\n")
    if tag == '*'
      let b:exdict_tag = ''
    endif
  endif
  setl completefunc=exdict#CompleteFromDict
  call feedkeys("\<c-x>\<c-u>\<c-p>", 'n')
  return ''
endfunction

