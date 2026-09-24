# :: c a u s t i c  c o m p u t i n g ::
# ~/.aliases.zsh
# host: $HOSTNAME
# Z shell aliases configuration file
# created <2026-09-24> :: last modified <2026-09-24T14:45-06:00>
#
# --- BEGIN CONFIGURATION FILE ---

# :: shell ::
alias sudo='sudo '         # leaves a space so aliases can be sudo'ed
alias :q='exit'
alias reload='exec zsh'    # refresh the shell after editing dotfiles

# :: navigation ::
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'          # '--' tells the 'alias' command to stop looking
                           # for command options and confusing the shell
                           # when the alias name starts with '-' (hyphen)

# :: listing ::
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lh'
alias lsa='ls -lah'

# :: search ::
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# :: network ::
alias ip='ip --color=auto'

# :: editors ::
alias e='emacsclient -nw'
alias nv='nvim'
alias neovim='nvim'

# :: languages ::
alias p3='python3'
alias py='python3'

# :: system ::
alias ff='fastfetch'
alias fetch='fastfetch --config none'
alias zzz='systemctl sleep'    # reads /etc/systemd/sleep.conf to suspend or hibernate

# :: pipes (global aliases) ::
# expand anywhere on the line, e.g.: 'journalctl -b G error L'
# NOTE: 'mkdir G' or 'touch L' WILL turn into pipes: escape them
# with 'mkdir \G' should it ever be needed
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g NE='2>/dev/null'    # discard errors

# --- END CONFIGURATION FILE ---
