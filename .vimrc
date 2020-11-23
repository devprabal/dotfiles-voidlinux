call plug#begin('~/.vim/plugged')
""" colorschemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'lifepillar/vim-solarized8'
""" features
"Plug 'sheerun/vim-polyglot'
call plug#end()

syntax on
set number
set relativenumber
set tabstop=8
set autoindent
set cursorline
set hlsearch
set nocompatible

""" for termguicolors to work
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

""" solarized8 colorscheme
"set termguicolors
"set background=light
"set background=dark 
"colorscheme solarized8_flat
"colorscheme solarized8
"colorscheme solarized8_high
"colorscheme solarized8_low

""" onehalf colorscheme config
set termguicolors
colorscheme onehalflight
"colorscheme onehalfdark
"set t_Co=256 "is also supported

""" forest-night colorscheme config
"set termguicolors
"let g:forest_night_enable_italic = 1
"colorscheme forest-night

""" gruvbox-material colorscheme config
"set termguicolors
"set background=dark
"let g:gruvbox_material_background = 'soft' "use medium for light background
"set background=light
"let g:gruvbox_material_background = 'medium' "use soft for dark background
"let g:gruvbox_material_enable_italic = 1
"colorscheme gruvbox-material

""" gruvbox colorscheme config
"set background=light "dont use dark, use gruvbox-material for dark
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_light = 'medium'
"let g:gruvbox_hls_cursor = 'orange'
"let g:gruvbox_termcolors = '16'
"set termguicolors
"autocmd vimenter * colorscheme gruvbox

