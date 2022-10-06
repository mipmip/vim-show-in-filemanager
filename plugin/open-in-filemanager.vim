function! s:OpenInFileManager()
  if has('macunix')
    let l:fcommand = "open -R"
    let l:dcommand = "open"
  else
    let l:fcommand = "nautilus -s"
    let l:dcommand = "nautilus"
  endif

  if filereadable(expand("%"))
    let l:command = l:fcommand . " " . shellescape("%")
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = l:dcommand . " " . shellescape("%") . ":p:h"
  else
    let l:command = l:dcommand " ."
  endif

  execute ":silent! !" . l:command . "&"
  redraw!
endfunction

command! OIFM call <SID>OpenInFileManager()
