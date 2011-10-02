#!/bin/bash

SYSTAGS_OUT="$HOME/.vim/systags"
TAGFLIST="/usr/include/*"
RTAGFLIST="/usr/include/gtk-2.0/ \
    /usr/include/sys/ \
    /usr/include/bits/ \
    /usr/include/glib-2.0/ \
    /usr/include/mysql/ \
    /usr/include/net \
    /usr/include/netinet \
    /usr/include/cairo \
    /usr/include/qt4"

CTAGS_FLAGS="--c++-kinds=+p --fields=+iaS --extra=+q"

[[ -x /usr/bin/ctags ]] && \
    /usr/bin/ctags --verbose $CTAGS_FLAGS -f $SYSTAGS_OUT $TAGFLIST -R $RTAGFLIST
ls -lh $SYSTAGS_OUT
