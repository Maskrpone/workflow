#!/bin/sh
#!/bin/sh
workspaces() {

ws1="1"
ws2="2"
ws3="3"
ws4="4"
ws5="5"
ws6="6"

# Unoccupied
un="0"

# check if Occupied
# o1=$(bspc query -D -d .occupied --names | grep "$ws1" )
if [[ $(bspc query -D -d .occupied --names | grep "$ws1") ]]; then
  o1=1;
fi
# o2=$(bspc query -D -d .occupied --names | grep "$ws2" )
if [[ $(bspc query -D -d .occupied --names | grep "$ws2") ]]; then
  o2=1;
fi
# o3=$(bspc query -D -d .occupied --names | grep "$ws3" )
if [[ $(bspc query -D -d .occupied --names | grep "$ws3") ]]; then
  o3=1;
fi
# o4=$(bspc query -D -d .occupied --names | grep "$ws4" )
if [[ $(bspc query -D -d .occupied --names | grep "$ws4") ]]; then
  o4=1;
fi
# o5=$(bspc query -D -d .occupied --names | grep "$ws5" )
if [[ $(bspc query -D -d .occupied --names | grep "$ws5") ]]; then
  o5=1;
fi
# check if Focused
f1=$(bspc query -D -d focused --names | grep "$ws1" )
f2=$(bspc query -D -d focused --names | grep "$ws2" )
f3=$(bspc query -D -d focused --names | grep "$ws3" )
f4=$(bspc query -D -d focused --names | grep "$ws4" )
f5=$(bspc query -D -d focused --names | grep "$ws5" )
f6=$(bspc query -D -d focused --names | grep "$ws6" )

ic_1=""
ic_2=""
ic_3=""
ic_4=""
ic_5=""

if [ $o1 ]; then
    ic_1="󰊠"
elif [ $o2 ]; then
    ic_2="󰊠"
elif [ $o3 ]; then
    ic_3="󰊠"
elif [ $o4 ]; then
    ic_4="󰊠"
elif [ $o5 ]; then
    ic_5="󰊠"
fi

if [ $f1 ]; then
    ic_1="󰮯"
elif [ $f2 ]; then
    ic_2="󰮯"
elif [ $f3 ]; then
    ic_3="󰮯"
elif [ $f4 ]; then
    ic_4="󰮯"
elif [ $f5 ]; then
    ic_5="󰮯"
fi

echo 	"(box	:class \"works\" :spacing \"-1\" :orientation \"h\" :halign \"center\" :space-evenly \"false\" (button :onclick \"bspc desktop -f $ws1\"	:class	\"$un $o1 $f1\"	\"$ic_1\") (button :onclick \"bspc desktop -f $ws2\"	:class \"$un $o2 $f2\"	 \"$ic_2\") (button :onclick \"bspc desktop -f $ws3\"	:class \"$un $o3 $f3\" \"$ic_3\") (button :onclick \"bspc desktop -f $ws4\"	:class \"$un $o4 $f4\"	\"$ic_4\") (button :onclick \"bspc desktop -f $ws5\"	:class \"$un $o5 $f5\" \"$ic_5\"))"
# echo "o1 : $o1 o2 : $o2 o3 : $o3 o4 : $o4 o5 : $o5"
}
workspaces
bspc subscribe all | while read -r _ ; do
workspaces
done
