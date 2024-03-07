#bash program to wine start VSeeFace and start and kill facetrack.py
#see https://www.vseeface.icu/#running-on-linux-and-maybe-mac

if [ "$(pstree -pla | grep facetracker.py | sed '/grep/d')" == "" ]; then
    printf "starting facetrack.py"
    cd ~/stuff/manual-programs/OpenSeeFace
    source env/bin/activate
    nohup python facetracker.py -c 0 -W 1280 -H 720 --discard-after 0 --scan-every 0 --no-3d-adapt 1 --max-feature-updates 900 & disown
fi

if [ "$(pstree -pla | grep VSeeFace.exe | sed '/grep/d')" == "" ]; then
    printf "starting VSeeFace"
    cd ~/.wine/drive_c/VSeeFace
    wine64 ./VSeeFace.exe & disown
fi

read -p "kill facetrack?"

pids=$(pstree -pla | grep facetracker.py | sed 's,|,,g' | sed 's/  //g' | sed 's/^ //g' | sed 's/ .*//' | sed 's/[^0-9]*//g')

echo $pids
kill $pids
