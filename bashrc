export PATH="$PATH:/Applications/Dev Desktop/drush"
alias vi="vim"
###-begin-nativescript-completion-###
if complete &>/dev/null; then
  _nativescript_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           nativescript completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _nativescript_completion -o default nativescript
elif compctl &>/dev/null; then
  _nativescript_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       nativescript completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _nativescript_completion -f nativescript
fi
###-end-nativescript-completion-######-begin-tns-completion-###
if complete &>/dev/null; then
  _tns_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           tns completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _tns_completion -o default tns
elif compctl &>/dev/null; then
  _tns_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       tns completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _tns_completion -f tns
fi
###-end-tns-completion-###
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


deploy () {
  read -p "Are you sure you want to continue? <y/N> " prompt
  if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
  then
    echo 'deploying'
    rm -rf ~/prev && mv ~/public_html ~/prev && mv ~/next ~/public_html
    # drush @campus.live rr
    # drush @campus.live cc all
    # drush @campus.live fr campus_config
    # drush vset 
  else
    exit 0
  fi
}

rollback () {
  read -p "Are you sure you want to continue? <y/N> " prompt
  if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
  then
    echo 'rolling back'
    mv ~/public_html ~/next && mv ~/prev ~/public_html
    # drush @campus.live rr
    # drush @campus.live cc all
    # drush @campus.live fr campus_config
    # drush vset 
  else
    exit 0
  fi
}

export ATESTVAR="yo"
