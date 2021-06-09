" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = []

function! s:SetColors()
  let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
  let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
  echo 'List of colors set from all installed color schemes'
endfunction

function! NextColor(how)
  if len(s:mycolors) == 0
    call s:SetColors()
  endif
  let current = exists('g:colors_name') ? index(s:mycolors, g:colors_name)+a:how : -1
  if current < 0
    let current = len(s:mycolors)-1
  elseif current >= len(s:mycolors)
    let current = 0
  endif
  execute 'colorscheme '.s:mycolors[current]
  redraw
  echo g:colors_name
endfunction

command! SetColors call s:SetColors()
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
