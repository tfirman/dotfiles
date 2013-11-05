# Globals
set -x EDITOR 'vim'

# Dotfiles bins
set PATH (dirname (status -f))"/../bin" $PATH

# Ruby optimizations
set -x RUBY_HEAP_MIN_SLOTS 800000
set -x RUBY_HEAP_FREE_MIN 100000
set -x RUBY_HEAP_SLOTS_INCREMENT 300000
set -x RUBY_HEAP_SLOTS_GROWTH_FACTOR 1
set -x RUBY_GC_MALLOC_LIMIT 79000000

# Rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Homebrew
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH

# Aliases
alias z "zeus"
alias b "bundle exec"

# Scala sbt opts
set -x SBT_OPTS "-Xms512M -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

# Haskell bins
set PATH $HOME/.cabal/bin $PATH

