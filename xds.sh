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

# XDS
echo -e "$MSGCOL Xds $ENDCOL"
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