#!/bin/bash

echo SETTING MIMES
unset BROWSER
xdg-mime default zen.desktop application/pdf
xdg-mime default pinta.desktop image/jpeg
xdg-mime default pinta.desktop image/png
xdg-mime default pinta.desktop image/webp
xdg-mime default pinta.desktop image/gif
xdg-settings set default-web-browser custom-zen.desktop
echo --------
