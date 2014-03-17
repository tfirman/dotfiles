########################################
# Plugins
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
. ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
. ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
. ~/.zsh/plugins/zsh-autosuggestions/autosuggestions.zsh

########################################
# Plugin Configuration

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

########################################
# Configuration
. $HOME/.zsh/path.zsh
. $HOME/.zsh/keys.zsh
. $HOME/.zsh/alias.zsh
. $HOME/.zsh/prompt.zsh

