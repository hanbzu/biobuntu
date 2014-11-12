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

# XDS
# Download tarfile and extract to a certain tools folder
# Then Path will have to be modified so that the system
# locates the executables from everywhere
mkdir -p ~/bin/xds
cd ~/bin/xds
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz | tar -xz
  mv XDS-INTEL64_Linux_x86_64/* .
  rm -r XDS-INTEL64_Linux_x86_64
else
  # 32 bit Linux
  curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-IA32_Linux_x86.tar.gz | tar -xz
  mv XDS-IA32_Linux_x86/* .
  rm -r XDS-IA32_Linux_x86
fi

# Pymol
echo -e "$MSGCOL Pymol $ENDCOL"
sudo apt-get install -y pymol

# Coot
# http://www2.mrc-lmb.cam.ac.uk/Personal/pemsley/coot/devel/build-info.html
echo -e "$MSGCOL Coot $ENDCOL"
mkdir -p ~/bin
cd ~/bin
COOT_NAME=coot-Linux-x86_64-ubuntu-12.04.3-gtk2-python
COOT_VER=coot-0.8.1-pre-revision-5394-binary-Linux-x86_64-ubuntu-12.04.3-python-gtk2
curl http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/binaries/pre-release/$COOT_VER.tar.gz | tar -xz
cd ~/bin/$COOT_NAME
sudo ln -s ~/bin/$COOT_NAME/bin/coot /usr/local/bin/coot

# CCP4
echo -e "$MSGCOL CCP4 $ENDCOL"
mkdir -p ~/bin
cd ~/bin
CCP4_VERSION=ccp4-6.4.0.1
curl ftp://ftp.ccp4.ac.uk/ccp4/6.4.0/${CCP4_VERSION}-linux-x86_64.tar.gz | tar -xz
cd ~/bin/ccp4-6.4.0
./BINARY.setup
# But a setup file should be called at each new session: add to zshrc

