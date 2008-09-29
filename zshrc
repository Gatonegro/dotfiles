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
if test $SSH_CLIENT; then
  RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info )%{$reset_color%}%{$fg_bold[blue]%}[%n@%m]%{$reset_color%}'$RPROMPT
else
  RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%} '$RPROMPT
fi
export PROMPT='%{$fg_bold[green]%}%m%{$reset_color%}.%{$fg[red]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%}>%{$reset_color%}'
