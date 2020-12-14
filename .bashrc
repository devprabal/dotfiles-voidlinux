## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## alias
if [[ -f $HOME/.bash_aliases ]]; then
	. $HOME/.bash_aliases
fi

## prompt
#PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

## colors in `man` (`man` uses `less` as PAGER)
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;37m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

## bat env variable (alternatively, bat supports a config file also)
export BAT_THEME="OneHalfLight"

## my scripts
export PATH="$HOME/bin:$PATH"
