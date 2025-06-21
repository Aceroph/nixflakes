PROMPT="%{$fg[yellow]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

RPROMPT="%T "

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}%1{✔%}"
