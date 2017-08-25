# CD Helper
function cd --description "Change working directory"
  builtin cd $argv
  emit cwd
end


################################################################################
# PATHS

# Dotfiles bin
set PATH (dirname (status -f))"/../bin" $PATH
set PATH $HOME/local/bin $PATH

# Homebrew bin
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH

# Android
set -x ANDROID_HOME /usr/local/share/android-sdk
set -x ANDROID_NDK_HOME /usr/local/share/android-ndk

# Scala sbt opts
set -x SBT_OPTS "-Xms512M -Xmx2G -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

################################################################################
# Make flags
set CPPFLAGS '-I$HOME/local/include'
set CFLAGS '-I$HOME/local/include'
set LDFLAGS '-L$HOME/local/lib'

################################################################################
# Environment variables

set -x GIT_SSH git-ssh

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

if test -f .config/fish/custom.fish
  source .config/fish/custom.fish
end

