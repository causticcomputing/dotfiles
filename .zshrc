# :: c a u s t i c  c o m p u t i n g ::
# ~/.zshrc 
# host: $HOSTNAME
# Z shell configuration file
# created <2026-09-21> :: last modified <2026-09-21T10:32-06:00>
#
# --- BEGIN CONFIGURATION FILE ---

# :: shell options ::
setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form 'anything=expression'
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt extendedglob        # enable extended globbing 

# :: history ::
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify

# :: PATH ::
typeset -U path
path+=("$HOME/.local/bin")
[[ -d /usr/games ]] && path+=(/usr/games)
path+=("$HOME/.config/emacs/bin")

# :: editor ::
export EDITOR=nvim
export VISUAL=nvim

# :: aliases ::
if [[ -f "$HOME/.aliases.zsh" ]]; then
  source "$HOME/.aliases.zsh"
fi

# :: ls colors ::
alias ls='ls --color=auto'
eval "$(dircolors -b)"

# :: zsh tab completion ::
# thanks to 'ctechtools' on GitHub for the speedup
# only check the dump once a day
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# :: menu selection & colored completions ::
zstyle ':completion:*' rehash true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1
zstyle ':completion:*:descriptions' format '%B%d%b'

# :: key bindings ::
# emacs mode
bindkey -e
# word navigation
bindkey "^[[1;3D" backward-word   # Alt + <--
bindkey "^[[1;3C" forward-word    # Alt + -->
bindkey "^[[1;5D" backward-word   # Ctrl + <--
bindkey "^[[1;5C" forward-word    # Ctrl + -->

# :: git prompt ::
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info

ZSH_THEME_GIT_PROMPT_PREFIX="-%F{white}git://%B%F{white}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%f%F{cyan}-"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✗%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔%f"

zstyle ':vcs_info:*'                   enable git
zstyle ':vcs_info:git:*'               check-for-changes true
zstyle ':vcs_info:git:*'               formats '%b%m'
zstyle ':vcs_info:git:*'               actionformats '%b|%a%m'
zstyle ':vcs_info:git*+set-message:*'  hooks git-dirty

# escape branch (CVE-2021-45444); untracked files count as dirty
+vi-git-dirty()
{
  hook_com[branch]=${hook_com[branch]//\%/%%}

  if [[ -n ${hook_com[staged]}${hook_com[unstaged]} ]] ||
     [[ -n $(GIT_OPTIONAL_LOCKS=0 git ls-files --others --exclude-standard 2>/dev/null) ]]; then
    hook_com[misc]=$ZSH_THEME_GIT_PROMPT_DIRTY
  else
    hook_com[misc]=$ZSH_THEME_GIT_PROMPT_CLEAN
  fi
}

# :: zsh prompt ::
PROMPT='%F{cyan}┌[%B%F{white}%n%b%f%F{cyan} ◆ %B%F{white}%M%b%f%F{cyan}]%F{white}-%F{cyan}(%B%F{white}%~%b%f%F{cyan})${vcs_info_msg_0_:+${ZSH_THEME_GIT_PROMPT_PREFIX}${vcs_info_msg_0_}${ZSH_THEME_GIT_PROMPT_SUFFIX}}
└> % %f'

# :: syntax highlighting styles ::
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern cursor root)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]=fg=51
ZSH_HIGHLIGHT_STYLES[precommand]=fg=123,underline
ZSH_HIGHLIGHT_STYLES[function]=fg=45,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=141,bold
ZSH_HIGHLIGHT_STYLES[default]=fg=123
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=196,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=105,bold
ZSH_HIGHLIGHT_STYLES[argument]=fg=51
ZSH_HIGHLIGHT_STYLES[comment]=fg=82,bg=235
ZSH_HIGHLIGHT_STYLES[redirection]=fg=201,underline
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=198,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=93
ZSH_HIGHLIGHT_STYLES[pattern:^-[-a-zA-Z0-9]+]=fg=208,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=99
ZSH_HIGHLIGHT_STYLES[path]=fg=207,bold,underline
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=15,bold
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=201,underline,bg=236
ZSH_HIGHLIGHT_STYLES[globbing]=fg=201,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=123,underline
ZSH_HIGHLIGHT_STYLES[command-substitution]=fg=87
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=93,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=fg=141
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=207
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=93,underline
ZSH_HIGHLIGHT_STYLES[named-fd]=fg=99,bold

# :: plugins ::
# detect plugin directories
if [[ -d /usr/share/zsh/plugins ]]; then
  ZSH_PLUGIN_DIR=/usr/share/zsh/plugins
else
  ZSH_PLUGIN_DIR=/usr/share
fi

# :: autosuggestions ::
if [[ -f $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# :: syntax highlighting (keep last or highlighting won't work!) ::
if [[ -f $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- END CONFIGURATION FILE ---
