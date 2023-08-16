#!/usr/bin/env bash

if [[ $(eww windows | grep "*$1") ]]; then
  eww close $1;
  else
    eww open $1;
fi


