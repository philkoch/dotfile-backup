#ENVIRONMENT VARIABLES
BROWSER=/usr/bin/firefox-nightly
#set editor variables for sudo use
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL BROWSER

#ruby gem installation not systemwide
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH="$PATH:/home/phil/.gem/ruby/2.4.0/bin"

# X S E R V E R
startx
