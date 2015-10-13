if exists("g:loaded_vim_jsx_helper") || &cp || v:version < 700
  finish
endif

let g:loaded_vim_jsx_helper = 1

function! PrintFunction(parm)
  if a:parm == 1
    normal! a: function() {
    normal! o},
    normal! k$F(
  elseif a:parm == 2
    normal! a(function() {
    normal! o});
    normal! k$F(
  elseif a:parm == 3
    normal! a = React.createClass({});
    exec "normal! hhi\r"
    normal! Orender: function() {}
    exec "normal! i\r"
    normal! Oreturn ();
    normal! h
  endif
endfunction

autocmd BufNewFile,BufReadPost *.jsx inoremap <C-F>, <esc>:call PrintFunction(1);<cr>
autocmd BufNewFile,BufReadPost *.jsx inoremap <C-F>( <esc>:call PrintFunction(2);<cr>
autocmd BufNewFile,BufReadPost *.jsx inoremap <C-F>R <esc>:call PrintFunction(3);<cr>

