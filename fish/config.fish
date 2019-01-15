# CD Helper
function cd --description "Change working directory"
  builtin cd $argv
  emit cwd
end

# Remove Duplicates From Path
function varclear --description 'Remove duplicates from environment variable'
    if test (count $argv) = 1
        set -l newvar
        set -l count 0
        for v in $$argv
            if contains -- $v $newvar
                set count (math $count+1)
            else
                set newvar $newvar $v
            end
        end
        set $argv $newvar
        test $count -gt 0
        and echo Removed $count duplicates from $argv
    else
        for a in $argv
            varclear $a
        end
    end
end


################################################################################
# Environment variables

# PWD bin
set PATH ./bin $PATH
set PATH ./node_modules/.bin/ $PATH

# Fulcrum tools
if test -d "$HOME/local/src/fulcrum/dev-tools/bin"
  set PATH $HOME/local/src/fulcrum/dev-tools/bin $PATH
end
if test -d "$HOME/local/src/fulcrum/vm/bin"
  set PATH $HOME/local/src/fulcrum/vm/bin $PATH
  set -x VAGRANT_CWD $HOME/local/src/fulcrum/vm
end

# Dotfiles bin
set PATH (dirname (status -f))"/../bin" $PATH
set PATH $HOME/local/bin $PATH

# Homebrew bin
if test -d /usr/local/sbin
  set PATH /usr/local/sbin $PATH
end

if test -d /usr/local/bin
  set PATH /usr/local/bin $PATH
end

# Android
set -x ANDROID_HOME ~/Library/Android/sdk
if test -d "$ANDROID_HOME/tools/bin"
  set PATH "$ANDROID_HOME/tools/bin" $PATH
  set PATH "$ANDROID_HOME/platform-tools" $PATH
end

set -x ANDROID_NDK_HOME /usr/local/share/android-ndk
if test -d "$ANDROID_NDK_HOME"
  set PATH "$ANDROID_NDK_HOME" $PATH
end

set -x GIT_SSH git-ssh

# Scala sbt opts
set -x SBT_OPTS "-Xms512M -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

# GOPATH
#set -x GOPATH ~/local/src/twick00/go

# Gradle
#set -x GRADLE_HOME /usr/local/bin

# PATHS
#set PATH $HOME/local/src/fulcrum/dev-tools/bin $PATH
#set PATH $HOME/.cargo/bin $PATH
#set PATH $HOME/Library/Android/sdk/platform-tools $PATH
#set PATH $HOME/go/bin $PATH

# Clear extra PATH variables
varclear PATH

################################################################################
# Make flags
set CPPFLAGS '-I$HOME/local/include'
set CFLAGS '-I$HOME/local/include'
set LDFLAGS '-L$HOME/local/lib'

################################################################################
# Misc.

# Use vim as the default editor
if type vim 1>/dev/null
  set -x EDITOR 'vim'
end

################################################################################
# abbreviations

# Git
abbr g "git"
abbr g 'git'
abbr gpr 'git pull-request'
abbr gcm 'git checkout master'
abbr gp 'git pull'
abbr gcb 'git checkout -b'
abbr gb 'git branch'
abbr gd 'git diff'
abbr gs 'git status'
abbr gst 'git stash'
abbr gr 'git rebase'
abbr ga 'git add'
abbr gl 'git log'
abbr gco 'git checkout'
abbr gc 'git commit'
abbr gps 'git push'
abbr gcp 'git cherry-pick'

# ls
abbr l ls

# Android
abbr droid 'adb shell input text'

# Maven
abbr mvn-resolve 'mvn -q org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression='

# Misc. Productivity
abbr work 'cd ~/local/src/'
abbr port 'lsof -i tcp:'
abbr ip 'ifconfig | grep "inet " | grep -v 127.0.0.1'

if test -f ~/.config/fish/custom.fish
  source ~/.config/fish/custom.fish
end
