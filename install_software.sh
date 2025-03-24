#!/bin/bash

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

var=$(flatpak list --system | grep Obsidian | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep Obsidian | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub md.obsidian.Obsidian
	fi
fi
var=$(flatpak list --system | grep Spotify | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep Spotify | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub com.spotify.Client
	fi
	
fi
var=$(flatpak list --system | grep Telegram | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep Telegram | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub org.telegram.desktop.webview
	fi
fi
var=$(flatpak list --system | grep "signal" | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep "signal" | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub org.signal.Signal
	fi
fi
var=$(flatpak list --system | grep "gimp" | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep "gimp" | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub org.gimp.GIMP
	fi
fi
var=$(flatpak list --system | grep "Slack" | wc -l)
if [ "$var" -lt 1 ]; then
	var=$(flatpak list --user | grep "Slack" | wc -l)
	if [ "$var" -lt 1 ]; then
		flatpak install --user --assumeyes flathub com.slack.Slack
	fi
fi

echo "Software successfully installed!"

echo "Disc space remaining:"
size=$(du -sh ~ | awk '{print $1}' | tr -d '[:alpha:]')
result=$(echo "scale=2;$size / 5" | bc)
result2=$(echo "scale=2;1 - 0$result" | bc | tr -d '[:punct:]')
echo $result2%
if [ "$result2" -lt 20 ]; then
echo Disc space low to examine enter:
echo \"ncdu ~\"
fi
