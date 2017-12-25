"" Last update: 22.12.2017 08:37
colorscheme desert
"set wrap " (no)wrap - динамический (не)перенос длинных строк
"set linebreak " переносить целые слова
"set showcmd " показывать незавершенные команды в статусбаре (автодополнение ввода)
"set mps+=<:> " показывать совпадающие скобки для HTML-тегов
"set showmatch " показывать первую парную скобку после ввода второй
set t_Co=256 " использовать больше цветов в терминале
set confirm " использовать диалоги вместо сообщений об ошибках
" Формат строки состояния
" fileformat - формат файла (unix, dos); fileencoding - кодировка файла;
" encoding - кодировка терминала; TYPE - тип файла, затем коды символа под
" курсором;
" позиция курсора (строка, символ в строке); процент прочитанного в файле;
" кол-во строк в файле;
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"Изменяет шрифт строки статуса (делает его не жирным)
"Изменяет шрифт строки статуса (делает его не жирным)
hi StatusLine gui=reverse cterm=reverse
set laststatus=2 " всегда показывать строку состояния
set noruler "Отключить линейку
"" Подсвечивать табы и пробелы в конце строки
set list " включить подсветку
set listchars=tab:>-,trail:- " установить символы, которыми будет осуществляться подсветка
"Проблема красного на красном при spellchecking-е решается такой строкой в
".vimrc
highlight SpellBad ctermfg=Black ctermbg=Red
au BufWinLeave *.* silent mkview " при закрытии файла сохранить 'вид'
au BufWinEnter *.* silent loadview " при открытии - восстановить сохранённый
set backspace=indent,eol,start " backspace обрабатывает отступы, концы строк
set sessionoptions=curdir,buffers,tabpages " опции сессий - перейти в текущую
"директорию, использовать буферы и табы
set noswapfile " не использовать своп-файл (в него скидываются открытые
"буферы)
set browsedir=current
" set visualbell " вместо писка бипером мигать курсором при ошибках ввода
set clipboard=unnamed " во избежание лишней путаницы использовать системный
"буфер обмена вместо буфера Vim
set backup " включить сохранение резервных копий
autocmd! bufwritepre * call BackupDir() " сделаем резервную копию перед перед буфера на диск
set title " показывать имя буфера в заголовке терминала
set history=128 " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N
set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
let c_syntax_for_h="" " необходимо установить для того, чтобы *.h файлам присваивался тип c, а не cpp
" При вставке фрагмента сохраняет отступ
set pastetoggle=
"подсвечивает все слова, которые совпадают со словом под курсором.
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
"НАСТРОЙКИ ПОИСКА ТЕКСТА В ОТКРЫТЫХ ФАЙЛАХ
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без учёта
set nohlsearch " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set incsearch " поиск фрагмента по мере его набора
set cursorline " подчёркивание текущей строки

" варианты кодировки файла по умолчанию (все файлы по умолчанию сохраняются в этой кодировке)
set fencs=utf-8,cp1251,koi8-r,cp866

" Перед сохранением .vimrc обновлять дату последнего изменения
autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))
syntax on " включить подсветку синтаксиса
"" Применять типы файлов
filetype on
filetype plugin on
filetype indent on
autocmd FileType perl call SetPerlConf()
"Удалять пустые пробелы на концах строк при открытии файла
autocmd BufEnter *.* :call RemoveTrailingSpaces()

set shiftwidth=4 " размер отступов (нажатие на << или >>)
set tabstop=4 " ширина табуляции
set softtabstop=4 " ширина 'мягкого' таба
set autoindent " ai - включить автоотступы (копируется отступ предыдущей строки)
set cindent " ci - отступы в стиле С
set expandtab " преобразовать табуляцию в пробелы
set smartindent " Умные отступы (например, автоотступ после {)
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

"ВКЛЮЧЕНИЕ АВТОДОПЛНЕНИЯ ВВОДА (omnifunct)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu




function! RemoveTrailingSpaces()
	normal! mzHmy
	execute '%s:\s\+$::ge'
	normal! 'yzt`z
	endfunction
