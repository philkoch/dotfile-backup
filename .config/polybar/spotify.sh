#!/bin/sh
##############################################################
#               SPOTIFY-META                                 #
##############################################################
# A customizable script that prints out the meta-information
# of the spotify client.
# Configure what information you want to see and how 
# long the text may be.
#
# $1 = the format that is put out
#   Possible values for the format are:
#   %artist% - displays the name of the artist
#   %title% - displays the name of the title
#   %album% - displays the name of the album
#   %trackNo% - displays the number of the track
#
# $2 = the max length of the output in characters (optional) #
# $3 = apply max length on each value (true) or on the       #
#   whole output(false or '')                                #
##############################################################    



main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi
  local format="$1"
  #check if second argument is given
  if [ -z $2 ];then
      maxLength=0
  else
      maxLength=$2
  fi
  cmd="org.freedesktop.DBus.Properties.Get"
  domain="org.mpris.MediaPlayer2"
  path="/org/mpris/MediaPlayer2"

  meta=$(dbus-send --print-reply --dest=${domain}.spotify \
    $path $cmd string:${domain}.Player string:Metadata)

  artist=$(escapeSpecialChars "$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1)")
  album=$(escapeSpecialChars "$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)")
  title=$(escapeSpecialChars "$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)")
  trackNo=$(echo "$meta" | sed -nr '/xesam:trackNumber"/,+2s/^ +variant +int32 (.*)$/\1/p' | tail -1)
   
  #check if length of the values is longer than $maxLength and if so shorten it
  if [ $maxLength -gt 0 ];then
      artist=$(cutIfNecessary "$artist" $maxLength)
      album=$(cutIfNecessary "$album" $maxLength)
      title=$(cutIfNecessary "$title" $maxLength)
      trackNo=$(cutIfNecessary "$trackNo" $maxLength)
  fi

  output=$(replacePlaceholder "$format")
  echo $output
}

cutIfNecessary(){
    local value="$1"
    local -i maxLength=$2
    local -i length=${#value}
    if [ $length -gt $maxLength ]; then
        local -i realLength=$(($maxLength - 3))
        cut=$(echo "$value" | cut -c 1-$realLength)
        echo "$cut"...
    else
        echo $value
    fi
}

#escapes the Ampersand [&] and forward slash [/]
escapeSpecialChars(){
  local unescapedText="$1"
  local escapedText=$(echo $unescapedText | sed 's/\&/\\\&/g' | sed 's/\//\\\//g')
  echo $escapedText
}

#replaces the placeholders (%title%... ) with correct variable values
replacePlaceholder(){
    local replace=$1
    #replaceArtist
    local replace=$(echo $replace | sed "s/%artist%/$artist/g")
    #replace title
    local replace=$(echo $replace | sed "s/%title%/$title/g")
    #replace album
    local replace=$(echo $replace | sed "s/%album%/$album/g")
    #replace trackNumber
    local replace=$(echo $replace | sed "s/%trackNo%/$trackNo/g")
    echo $replace
}


main "$@"
