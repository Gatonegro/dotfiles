if [[ "$TERM" != "dumb" ]]; then
	#export PROMPT="%{$fg[blue]%}%1~%{%(!.$fg[red].$fg[green])%}>%{$reset_color%} "
	export PROMPT='%{$fg_bold[green]%}%m%{$reset_color%}.%{$fg[red]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%}>%{$reset_color%}'
	#export RPROMPT='%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%} '
else
  export PROMPT="%(?..[%?] )%n:%1~> "
fi

setopt autopushd


export PATH="/opt/scripts/:$PATH"
export MANPATH=$MANPATH":/opt/local/share/man"
export INFOPATH=$INFOPATH":/opt/local/share/info"
#export PATH="/opt/local/apache2/bin:/opt/local/nginx/sbin:/opt/local/mysql/bin:$PATH"

export SVN_EDITOR="nano"

if [[ $TERM == "screen"* ]]; then
  #TAB_TITLE_PREFIX='"$PROMPT_CHAR"'
  TAB_TITLE_PROMPT='`print -Pn "%~" | sed "s:\([~/][^/]*\)/.*/:\1...:"`'
  TAB_TITLE_EXEC='`case $cmd[1]:t in ; "sudo") echo $cmd[2]:t;; *) echo $cmd[1]:t;; esac`'

  function screen_set(){
    #  (%t) en screen
    print -nR $'\033k'"$1"$'\033'\\\
  }

  function preexec()  {
    local -a cmd; cmd=(${(z)1}) # the command string
    eval "tab_title=$TAB_TITLE_PREFIX$TAB_TITLE_EXEC"
    screen_set "$tab_title"
  }

  function precmd()  {
    eval "tab_title=$TAB_TITLE_PREFIX$TAB_TITLE_PROMPT"
    screen_set $tab_title
  }
fi



export JAVA_HOME="/Library/Java/Home"
export CLASSPATH="/opt/local/java-libs/javamail-1.4.1/mail.jar:/opt/local/java-libs/jaf-1.1.1/activation.jar:"$CLASSPATH
export MOZILLA_FIVE_HOME=/opt/firefox/firefox

# Load some aliasses
. ~/.aliases

# Bind Keys
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
