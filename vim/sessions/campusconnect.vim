" ~/.vim/sessions/campusconnect.vim:
" Vim session script.
" Created by session.vim 2.4.4 on 28 June 2013 at 20:29:25.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrLt
silent! set guifont=Andale\ Mono\ Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h14,Courier\ New\ Regular:h14
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'molokai' | colorscheme molokai | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/campus
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +20 www/sites/default/modules/campusconnect/campusconnect.module
badd +7 www/sites/default/modules/campusconnect/campusconnect.info
badd +1 www/sites/default/modules/campusconnect/campusconnect.install
badd +4 www/sites/default/modules/campusconnect/campusconnect.theme.inc
badd +1 www/sites/default/modules/campusconnect/campusconnect.admin.inc
badd +1 wa
badd +1 yo\\
silent! argdel *
edit www/sites/default/modules/campusconnect/campusconnect.admin.inc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=expr
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Projects/campus
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=1 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
tabnext 1
1wincmd w
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf)) && !getbufvar(s:wipebuf, '&modified')
    let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
    if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
      silent exe 'bwipe ' . s:wipebuf
    endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
