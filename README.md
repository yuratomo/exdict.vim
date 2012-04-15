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

Requirements
------------
exdict.vim is requires grep-program. 
please set &grepprg.

Usage
-----

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
    let g:exdict#disable_default_keymap = 1
    imap <buffer><c-k> <ESC><Plug>(exdict-prev-i)
    imap <buffer><c-j> <ESC><Plug>(exdict-next-i)
    nmap <buffer><c-k> <Plug>(exdict-prev-n)
    nmap <buffer><c-j> <Plug>(exdict-next-n)


Default Keymaps
---------------
* imap <c-j>   Show Next Inline Api Reference (input mode)
* imap <c-k>   Show Previous Inline Api Reference (input mode)
* nmap <c-j>   Show Next Inline Api Reference (normal mode)
* nmak <c-k>   Show Previous Inline Api Reference (normal mode)


ScreenShots
-----------

###Dictionary###

ex) Input "Create" + &lt;c-x&gt;&lt;&gt;c-k&lt;.

![sample1](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.001.png "sample1")

###Syntax Highlight###

ex) Highlighting CreateEvent (it'a win32api)

![sample2](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.002.png "sample2")

###Inline Api Reference###

ex) Inline help of CreateEventA.

![sample3](http://yuratomo.up.seesaa.net/image/exdictvim_v0.1.0.003.png "sample3")


HISTORY
-------

### v0.1.0 by yuratomo ###
* first version


