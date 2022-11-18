#!/bin/bash

# This BASH script is made for debian-based linux distributions. As of writing, this is the only version that exists for now.
# It installs many of the packages I often use day-to-day, utilities etc.

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NOCOLOR='\033[0m'

if [ "$EUID" -ne 0 ]
  then echo -e "$RED Running this program as root is better.$NOCOLOR Please try running as root to avoid password prompts!"
fi

echo -e "Typing in $GREEN \"YES\" $NOCOLOR will install the following programs and their dependencies:"
echo "============================================================================="
echo -e "$ORANGE - neofetch\n - vim\n - nano\n - webapp-manager\n - krita\deepin-terminal (looks good)\n - python3 & pip\n - snap & snap-store\n - flatpak\n"

read CONFIRMATION
if [ "${CONFIRMATION,,}" == "yes" ]
then
  apt update
  apt-get install -f neofetch nano vim webapp-manager krita deepin-terminal python3 python3-pip snapd flatpak
  set -e
  snap install snap-store
else
	exit
fi