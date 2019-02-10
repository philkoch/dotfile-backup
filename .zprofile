#ENVIRONMENT VARIABLES
#BROWSER=/usr/bin/firefox-nightly
BROWSER=/usr/bin/qutebrowser
#set editor variables for sudo use
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL BROWSER

#ruby gem installation not systemwide
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH="$PATH:/home/phil/.gem/ruby/2.4.0/bin"
#newer ruby version
export PATH="$PATH:/home/phil/.gem/ruby/2.5.0/bin"

#yarn stuff
export PATH="$PATH:/home/phil/.config/yarn/global/node_modules/.bin/"

export WALLPAPER="/home/phil/Pictures/wallpapers/Abstract-Minimalist-Art-Hipster-www.wallpapersbrowse.com.jpg"

#add custom scripts folder to path
export PATH="$PATH:/home/phil/scripts/system/"

#add secret env_vars
source /home/phil/.secret_env

# X S E R V E R
startx
