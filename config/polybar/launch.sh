#!/usr/bin/env bash

# Terminate previous sessions of polybar
killall -q polybar

echo "---" | tee /tmp/polybar.log

polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

