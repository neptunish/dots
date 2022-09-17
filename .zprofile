#
# .zprofile
#
export SOPS_AGE_KEY_FILE="~/.config/sops/age/keys.txt"

export KUBECONFIG="~/.kube/sbc.config"
export KUBECONFIG="~/.kube/sbc.config:${KUBECONFIG}"

### browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

### editors
export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

### language
export LANG="${LANG:-en_US.UTF-8}"
export LANGUAGE="${LANGUAGE:-en}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

### paths
# ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# set the list of directories that `cd` searches
# cdpath=(
#   $cdpath
# )

# set the list of directories that zsh searches for commands
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

### less

# set default less options
export LESS="${LESS:--g -i -M -R -S -w -z-4}"

# set the less input preprocessor
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

export HISTORY_IGNORE="(ls|bg|fg|pwd|q|p|exit|cd ..|cd -|pushd|popd)"
