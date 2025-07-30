#!/bin/bash

echo SETTING MIMES
unset BROWSER
xdg-settings set default-web-browser librewolf.desktop
xdg-mime default librewolf.desktop application/pdf
xdg-mime default pinta.desktop image/jpeg
xdg-mime default pinta.desktop image/png
xdg-mime default pinta.desktop image/webp
xdg-mime default pinta.desktop image/gif
echo --------
