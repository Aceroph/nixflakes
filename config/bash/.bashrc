direnv_prompt() {
  if [[ -n "$DIRENV_DIR" ]]; then
      echo -ne "\[\e[94m\](env)\[\e[0m\] "
  fi
}

git_prompt() {
  local branch up down untracked staged
  branch=$(git branch --show-current 2>/dev/null)

  if [[ -n "$branch" ]]; then
      echo -ne " on \[\e[91;1m\]$branch\[\e[0m\]"

      if [[ -d "$PWD/.git/refs/remotes/" ]]; then
          up=$(git log origin/"$branch"..HEAD --oneline 2>/dev/null | wc -l)
          down=$(git log HEAD..origin/"$branch" --oneline 2>/dev/null | wc -l)

          [[ "$up" -gt 0 ]] && echo -ne " \[\e[92;1m\]+$up\[\e[0m\]"
          [[ "$down" -gt 0 ]] && echo -ne " \[\e[91;1m\]-$down\[\e[0m\]"
      fi

      untracked=$(git diff --numstat 2>/dev/null)
      staged=$(git diff --cached --numstat 2>/dev/null)

      [[ -n "$untracked" ]] && echo -ne " \[\e[96;1m\]U\[\e[0m\]"
      [[ -n "$staged" ]] && echo -ne " \[\e[94;1m\]S\[\e[0m\]"
  fi
}

set_prompt() {
  local direnv_part git_part cwd_part
  direnv_part=$(direnv_prompt)
  git_part=$(git_prompt)
  cwd_part="\[\e[93;1m\]\w\[\e[0m\]"

  PS1="${direnv_part}${cwd_part}${git_part} "
}

PROMPT_COMMAND=set_prompt
shopt -s checkwinsize
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
