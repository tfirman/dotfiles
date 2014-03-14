# Path
PATH=~/local/bin:$PATH
PATH=~/.rbenv/shims:$PATH

# Colors
autoload -U colors && colors

# Prompt
PS1="%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%}%
%(?..$fg_bold[red])
\$%{$reset_color%}%  "

# Aliases
alias ls="ls -G"
alias z="zeus"
alias zst="zeus start"
alias zs="zeus s"
alias zr="zeus r"
alias zt="zeus t"

# Completions
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

# Syntax highlight
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Substring search
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Autosuggest
source ~/.zsh/plugins/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
bindkey '^f' vi-forward-word
