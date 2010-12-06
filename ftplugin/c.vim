" GNU coding standard
function! GnuIndent() 
   setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 
   setlocal shiftwidth=2 
   setlocal tabstop=8 
endfunction 
call GnuIndent() 

set tags+=~/.vim/systags
