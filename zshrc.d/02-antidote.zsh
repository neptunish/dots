#
# 02-antidote - Use the antidote plugin manager.
#
export ZDOTDIR=~/.zsh

# referenced by exported ZDOTDIR
antidote_dir=${ZDOTDIR:-~}/.antidote
plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

zstyle ':antidote:bundle' use-friendly-names 'yes'

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    source $antidote_dir/antidote.zsh
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle <$plugins_txt >$static_file
  )
fi

zstyle ':antidote:bundle' use-friendly-names 'yes'

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $antidote_dir ]] ||
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    source $antidote_dir/antidote.zsh
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle <$plugins_txt >$static_file
  )
fi

# load zprof first if we need to profile

[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Zephyr zstyles
zstyle ':zephyr:*:*' use-xdg-basedirs 'yes'

zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:bundle' file $ZDOTDIR/.zsh_plugins.txt

# load antidote for patient
if [[ ! $ZDOTDIR/.zsh_plugins.zsh -nt $ZDOTDIR/.zsh_plugins.txt ]]; then
  [[ -e $antidote_dir ]] \
    || git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  (
    source $antidote_dir/antidote.zsh
    antidote bundle <$ZDOTDIR/.zsh_plugins.txt >$ZDOTDIR/.zsh_plugins.zsh
  )
fi
autoload -Uz $ANTIDOTE_DIR/functions/antidote
source $ZDOTDIR/.zsh_plugins.zsh

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }

