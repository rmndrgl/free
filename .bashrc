github_repository() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
    local repo_name=$(basename "$repo_root")
    local branch=$(git branch --show-current 2>/dev/null)

    if [ -z "$branch" ]; then
      branch=$(git rev-parse --short HEAD 2>/dev/null)
    fi

    local c_cyan=$'\001\e[1;36m\002'
    local c_yellow=$'\001\e[1;33m\002'
    local c_white=$'\001\e[0;37m\002'
    local c_reset=$'\001\e[0m\002'

    echo " ${c_white}{${c_cyan}${repo_name} ${c_white}(${c_yellow}${branch}${c_white})}${c_reset}"
  fi
}

export PS1='[\[\e[1;32m\]\w\[\e[0m\]] →$(github_repository)\n\[\e[1;35m\]⤷\[\e[0m\]  $ '
