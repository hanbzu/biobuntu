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

echo -e "$MSGCOL Installing a few bioinformatics tools: xds, pymol, coot & ccp4... $ENDCOL"
sudo apt-get update -qq | tee apt-get-update.log

# xds
./xds.sh | tee xds.log

# Pymol
echo -e "$MSGCOL Pymol $ENDCOL"
sudo apt-get install -y pymol | tee pymol.log

# Coot
./coot.sh | tee coot.log

# CCP4
./ccp4.sh | tee ccp4.log
