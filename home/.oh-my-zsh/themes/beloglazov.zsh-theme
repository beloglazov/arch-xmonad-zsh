# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if there are commits ahead from remote
function git_prompt_ahead_count() {
  log=$(git log origin/$(current_branch)..HEAD 2> /dev/null)
  if $(echo "$log" | grep '^commit' &> /dev/null); then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD_PREFIX$(echo "$log" | grep '^commit' | wc -l)$ZSH_THEME_GIT_PROMPT_AHEAD_SUFFIX"
  fi
}

PROMPT='%{$fg[red]%}%D{%I:%M}%{$fg_bold[red]%}%(!. ➜.)%{$fg_bold[green]%}%p %{$fg[cyan]%}%c $(git_prompt_info)$(git_prompt_ahead_count)$(parse_git_dirty)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD_PREFIX=" %{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_AHEAD_SUFFIX="%{$reset_color%}"