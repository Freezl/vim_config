# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias la='ls -lah'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# если bash запущен в неинтерактивном режиме (напр. вызван
# из скрипта) - не применять настройки, выйти
#[[ "$-" = *i* ]] && return 0 # return work only in functions
[[ -z "${PS1}" ]] && return 0

# подключить локальные настройки для хоста,
# функции и справку по ним, доп. пользовательские настройки.
# source может быть записана, как точка (.)
BASH_CONFIG_DIR="${HOME}/.config/bash"
if [[ -d ${BASH_CONFIG_DIR} ]]; then
    if [[ -r "${BASH_CONFIG_DIR}/bash_text-colors" ]]; then
        # "bash" - use bash escape symbols, "tput" - use tput
        BASH_COLOR_MODE="tput"
        source "${BASH_CONFIG_DIR}/bash_text-colors"
        #COLOR_PROMPT=yes
    fi
    source "${BASH_CONFIG_DIR}/bashrc_local"
    # or "-x $( /usr/bin/env git )" ?
    # type - built-in analog for "which"
    if [[ -x $( type -p git ) && -r "${BASH_CONFIG_DIR}/bash_git-prompt" ]]; then
        # simple bash git prompt: http://habrahabr.ru/post/248881/#comment_8244107
        # or fast multiple VCS info parser for prompt: https://bitbucket.org/gward/vcprompt
        source "${BASH_CONFIG_DIR}/bash_git-prompt"
        export GIT_PS1_SHOWDIRTYSTATE=1 # mark unstaged/staged changes in PS1
        export GIT_PS1_SHOWUNTRACKEDFILES=1 # mark untracked files in PS1
    fi
fi

# если доступен файл с описаниями для автодополнения команд
# оболочки - подгрузить и использовать его
if [[ -r /etc/bash_completion ]]; then
    source /etc/bash_completion
fi

# файл для хранения истории команд
export HISTFILE="${BASH_CONFIG_DIR}/bash_history"

# принудительное вкл. настроек ignoredups и ignorespace
# ignoredups - не сохранять строки, совпадающие с последней выполненной командой
# ignorespace - не сохранять команды, начинающиеся с пробела
export HISTCONTROL="ignoreboth"

# Не сохранять в истории вызовы перечисленных комманд:
export HISTIGNORE="&:ls:[bf]g:exit:history"

# сохранить все строки многострочной команды в одной записи списка истории
# это позволяет легко редактировать многострочные команды.
shopt -s cmdhist

# сохранять историю команд мгновенно, а не после завершения текущей сессии
PROMPT_COMMAND='history -a'

# сделать вывод less для не-текстовых файлов более понятным, см. lesspipe(1)
[[ -x $( type -p lesspipe ) ]] && eval "$(SHELL=/bin/sh lesspipe)"

[[ -x $( type -p most ) ]] && export PAGER=most

# включение поддержки цветного вывода некоторых команд
# если она установлена в системе
if [[ -x $( type -p dircolors ) ]]; then
    eval "$( dircolors -b )"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto --format=vertical'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias для различных команд
alias ll='ls -lhp'
alias lf='ls -lhF'
alias la='ls -lhap'
alias ping='ping -c 5'
alias pwgen='pwgen -syc'
alias top='htop'
alias rsync='rsync -P'
# df - вывод в человекопонятном виде, выводим типы ФС
alias df='df --human-readable --print-type'

alias iptablesL = 'iptables -L -nv --line-number'
