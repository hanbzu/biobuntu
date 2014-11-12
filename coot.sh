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

# http://www2.mrc-lmb.cam.ac.uk/Personal/pemsley/coot/devel/build-info.html
echo -e "$MSGCOL Coot $ENDCOL"
mkdir -p ~/bin
cd ~/bin
COOT_NAME=coot-Linux-x86_64-ubuntu-12.04.3-gtk2-python
COOT_VER=coot-0.8.1-pre-revision-5394-binary-Linux-x86_64-ubuntu-12.04.3-python-gtk2
curl http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/binaries/pre-release/$COOT_VER.tar.gz | tar -xz
cd ~/bin/$COOT_NAME
sudo ln -s ~/bin/$COOT_NAME/bin/coot /usr/local/bin/coot