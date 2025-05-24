if [ -z $(hyprctl getoption general:layout | grep master ) ]; then
    hyprctl keyword general:layout master
else
    hyprctl keyword general:layout dwindle
fi
