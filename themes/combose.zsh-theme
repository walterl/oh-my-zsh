# This is what happened to the bira theme after a bunch of modifications
local return_code="%(?..%{$fg[red]%}%? %1{↵%}%{$reset_color%})"

local bar="$terminfo[bold]$fg[white]|$reset_color"

if [[ $UID -eq 0 ]]; then
	local usercolor="$fg[black]$bg[red]";
	local prompt_symbol="%{$usercolor%}#"
else
	local usercolor="$fg[yellow]";
	local prompt_symbol="%{$usercolor%}$"
fi
local hostcolor="$terminfo[bold]$fg[green]"

if [ -f "$HOME/.zshrc.theme" ]; then
	# The idea here is to allow per-host theme changes. I use it to color host
	# names differently, by overriding the hostcolor variable.
	source "$HOME/.zshrc.theme"
fi

local host='%{$hostcolor%}%m%{$reset_color%}'
local user='%{$usercolor%}%n%{$reset_color%}'
local userhost="$user@$host"
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local prompt_date='%{$bar%}%{$fg[magenta]%}$(date +%H:%M:%S)%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="${userhost}:${current_dir}${git_branch}${prompt_date}
%B${prompt_symbol}%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$bar%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
