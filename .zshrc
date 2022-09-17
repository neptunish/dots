#
# .zshrc  
#
export ZDOTDIR=~/.zsh
autoload -Uz compinit && compinit

# load all the '.zshrc' parts divided by run order in ZDOTDIR/zshrc.d/
setopt EXTENDED_GLOB
for _zconf in $ZDOTDIR/zshrc.d/*.zsh(N); do
  # ignore files that begin with a tilde
  case ${f:t} in '~'*) continue;; esac
  source "$_zconf"
done
# if the host name matches specific alias's load those and general else just load general
if [[ -f $ZDOTDIR/zshrc.d/aliases-"$(uname)" ]]; then
  source $ZDOTDIR/zshrc.d/aliases
  source $ZDOTDIR/zshrc.d/aliases-"$(uname)"
else
  source $ZDOTDIR/zshrc.d/aliases
fi
unset _zconf

