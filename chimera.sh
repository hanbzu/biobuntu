#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands.
# --------------------------------------------

# Ubuntu codename and machine type
CODENAME=`lsb_release --codename | cut -f2`
MACHINE_TYPE=`uname -m`

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Chimera
# I did this by hand
# I downloaded it from https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py?file=linux_x86_64/chimera-1.9-linux_x86_64.bin
# NOTE: It asks to accept an agreement so it's hard to script this one out
# Then I saved it to ~/bin/packages
# I chmod +x it and then I run the bin
# I have to answer the questions:
# 1. ~/.local/UCSF-Chimera64-1.9 >>> ~/bin/UCSF-Chimera64-1.9
# 2. Install desktop menu and icon? yes
# 3. /usr/local/bin
# It will display a final notice like this one:
# -------------------------------------------------
# To (re)install desktop menu and icon later, run:
#   /home/enea/bin/UCSF-Chimera64-1.9/bin/xdg-setup install
# If run as root, then it only installs the menu
# (for all users).  Otherwise, it installs the icon
# (and menu, if need be) for the current user.
# -------------------------------------------------
# Then it leaves a launch icon on the desktop, which i moved to:
# sudo mv ~/Desktop/UCSF-Chimera64-1.9.desktop /usr/share/applications
