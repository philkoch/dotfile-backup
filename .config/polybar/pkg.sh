#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
color="#5b5b5b"
if [[ "$check" -eq "0" ]] 
then
    color="#5b5b5b"
elif [[ "$check" -gt 0 ]] && [[ "$check" -lt 10 ]] 
then
    color="#1793d0"
elif [[ "$check" -gt 10 ]] && [[ "$check" -lt 25 ]] 
then
    color="#f5a70a" 
else
    color="#ff5555"
fi

echo "PKG $pac %{F$color}%{F-} $aur AUR"
