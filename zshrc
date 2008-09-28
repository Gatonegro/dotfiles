. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

. ~/.shell-confs
#. ~/.zsh/screen
. ~/.zsh/zshprompt

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

# get the name of the branch we are on
git_prompt_info() {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}

export PROMPT='%{$fg_bold[green]%}%m%{$reset_color%}.%{$fg[red]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%}>%{$reset_color%}'
