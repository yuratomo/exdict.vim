exdict.vim
==========

Description
-----------
exdict.vim is a plugin on vim for syntax highlight and vim's dictionary and inline api reference by special dictionary.
Support dictionary is as follows.

    - c runtime library
    - Windows Api
    - Windows Kernel Api
    - Windows WDF (Windows Driver Foundation)
    - java (j2se6.0)

Requirements
------------
exdict.vim is requires grep-program. 
please set &grepprg.

Usage
-----

    1) Open *.c , *.cpp or *.java

    2) :LoadExdict


###Show Inline Api Reference:###

ex) printf

    printf(
           ~~~~~~~~~~~~~~
                 A
                 |
                 +-- input <c-j> at input mode or normal mode.

Settings
--------

###Specify Key :###
    " sorry. it is not work now.
    let g:exdict#disable_default_keymap = 1
    imap <buffer><c-UP>   <ESC><Plug>(exdict-next-i)
    imap <buffer><c-DOWN> <ESC><Plug>(exdict-prev-i)
    nmap <buffer><c-UP>   <Plug>(exdict-next-n)
    nmap <buffer><c-DOWN> <Plug>(exdict-prev-n)


###Disable Specify Dictionary :###
Disable win32 api dictionary.
    let g:exdict#disable_win32_api = 1

Disable win kernel api dictionary.
    let g:exdict#disable_win_kernel_api = 1

Disable win kmdf dictionary.
    let g:exdict#disable_win_kmdf = 1

Disable mfc dictionary.
    let g:exdict#disable_mfc = 1


Default Keymaps
---------------
* imap <c-DOWN> Show Next Inline Api Reference (input mode)
* imap <c-UP>   Show Previous Inline Api Reference (input mode)
* nmap <c-DOWN> Show Next Inline Api Reference (normal mode)
* nmap <c-UP>   Show Previous Inline Api Reference (normal mode)

ScreenShots
-----------

###Dictionary###

ex) Input "Create" + &lt;c-x&gt;&lt;c-k&gt;

![sample1](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.001.png "sample1")

###Syntax Highlight###

ex) Highlighting CreateEvent (it'a win32api)

![sample2](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.002.png "sample2")

###Inline Api Reference###

ex) Inline help of CreateEventA.

![sample3](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.003.png "sample3")


HISTORY
-------
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


