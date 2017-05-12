#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#


export PATH=$PATH:~/bin
export PATH=$PATH:/Applications/nyqosx311/NyquistIDE.app/Contents/Java
export PATH=$PATH:/Applications/nyqosx311

export XLISPPATH=/Applications/nyqosx311/NyquistIDE.app/Contents/Java/runtime:/Applications/nyqosx311/NyquistIDE.app/Contents/Java/lib

export THINGVAR="hello world"

export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"
