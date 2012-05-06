exdict.vim
==========

Description
-----------
exdict.vim is a plugin on vim for syntax highlight and competion by dictionary and show inline api reference by special dictionary.
Support dictionary is as follows.

    - c library
    - win32api
    - stl
    - mfc
    - posix
    - Windows Kernel Api
    - KMDF (Windows Driver Foundation)
    - java (j2se6.0)
    - php
    - wpf

Requirements
------------
exdict.vim is requires grep-program. 
please set &grepprg.

Usage
-----

    :LoadExdict [ms_c|win32_api|mfc|winddk|kmdf|j2se6|php|posix|wpf]{n}

###exdict completion###

1. Load exdict (for example mfc)

    :Exdict mfc

2. Press <c-j> in input mode.

3. Input keyword for narrow down. (for example input CString)

    input keyword:CString

4. Select api from completion menu.


###Show Inline Api Reference:###

ex) printf

    printf(
           ~~~~~~~~~~~~~~
                 A
                 |
                 +-- input <c-down> at input mode or normal mode.

Settings
--------

###Specify Key :###
    " sorry. it is not work now.
    let g:exdict#disable_default_keymap = 1
    imap <c-UP>   <ESC><Plug>(exdict-next-i)
    imap <c-DOWN> <ESC><Plug>(exdict-prev-i)
    nmap <c-UP>   <Plug>(exdict-next-n)
    nmap <c-DOWN> <Plug>(exdict-prev-n)
    imap <c-j>    <Plug>(exdict-omni-complete)


Default Keymaps
---------------
* imap <c-DOWN> Show Next Inline Api Reference (input mode)
* imap <c-UP>   Show Previous Inline Api Reference (input mode)
* nmap <c-DOWN> Show Next Inline Api Reference (normal mode)
* nmap <c-UP>   Show Previous Inline Api Reference (normal mode)
* imap <c-j>    Api Completion

ScreenShots
-----------

###Dictionary###

ex) Input "Create" + &lt;c-j&gt;

![sample1](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.001.png "sample1")

###Syntax Highlight###

ex) Highlighting CreateEvent (it'a win32api)

![sample2](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.002.png "sample2")

###Inline Api Reference###

ex) Inline help of CreateEventA.

![sample3](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.003.png "sample3")


HISTORY
-------
### v1.0.0 by yuratomo ###
* release version

### v0.6.1 by yuratomo ###
* modify command name. (LoadExdict -> Exdict)

### v0.6.0 by yuratomo ###
* add wpf php posix dictionary.
* stop auto load by filetype.

### v0.5.0 by yuratomo ###
* Stop auto load dictionary.
* Add :LoadExdict

### v0.4.0 by yuratomo ###
* Add g:exdict#disable_xxx
* Delete :FindRef

### v0.3.0 by yuratomo ###
* support mfc
* app :FindRef

### v0.2.1 by yuratomo ###
* Fix Extraction of the function name.
* Change default keymap.

### v0.2.0 by yuratomo ###
* support java

### v0.1.0 by yuratomo ###
* first version


