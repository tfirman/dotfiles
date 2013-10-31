# Ruby optimizations
set -x RUBY_HEAP_MIN_SLOTS 800000
set -x RUBY_HEAP_FREE_MIN 100000
set -x RUBY_HEAP_SLOTS_INCREMENT 300000
set -x RUBY_HEAP_SLOTS_GROWTH_FACTOR 1
set -x RUBY_GC_MALLOC_LIMIT 79000000

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

set -x SBT_OPTS "-Xms512M -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

cd .

