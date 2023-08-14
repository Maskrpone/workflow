#!/usr/bin/env bash

function workspaces() {
  
  ws=();

  # nbWs=$(bspc query -D --names | tail -n 1);

  for i in {1..5}; do
  
    unit="(button :onclick \"bspc desktop -f $i\" :class \"ws-empty ws-btn\" \"\")";

    if [[ $(bspc query -D -d .occupied --names |grep $i) ]]; then
      unit="(button :onclick \"bspc desktop -f $i\" :class \"ws-occupied ws-btn\" \"\")"; 
    fi
  
    if [[ $(bspc query -D -d .focused --names |grep $i) ]]; then
      unit="(button :onclick \"bspc desktop -f $i\" :class \"ws-focused ws-btn\" \"󰅟\")";
    fi

    ws+=$unit
  done


  echo "(box :class \"works\" :orientation \"h\" :halign \"center\" :valign \"start\" $ws)"
}


workspaces

bspc subscribe desktop node_transfer | while read -r _ ; do
    workspaces
done
