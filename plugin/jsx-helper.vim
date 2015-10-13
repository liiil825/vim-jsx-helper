if exists("g:loaded_vim_jsx_helper") || &cp || v:version < 700
  finish
endif

let g:loaded_vim_jsx_helper = 1

function! PrintFunction()
  normal! a: function() {
  normal! o},
endfunction

autocmd BufNewFile,BufReadPost *.jsx inoremap <C-F>, <esc>:call PrintFunction();<cr>

