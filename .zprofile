#ENVIRONMENT VARIABLES
BROWSER=/usr/bin/firefox-nightly
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

export TW_TOKEN="81fbda05-05ae-4a35-b912-e62ef9a5b232_3qDZgv7QQ7ynKBuUvpCdMuAn.zH8dcEBrN2tkpD.Mp3Ss0e9vM833k80FIjcPnOTTM7LXFBpjkh-F-0Y2M5KVO5rNeraImMeTcbeioBz94mH1GVLku0PR995sRrw-a8reZsejzcBjepfcme2FN2R63shU8tzUtyDyyMr7iTOuz8"

# X S E R V E R
startx
