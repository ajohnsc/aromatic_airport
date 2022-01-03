#/bin/bash
#
# Created by: AJ Canlas
# 

source sysad.cfg
cd $CONFIG_DIR/basic

while [ `vagrant status | grep basic | grep not | wc -l` -eq `echo 0` ]
do
    printf "Deleting basic box\t\t\t"
    vagrant destroy -f &> /dev/null && success_output || error_output
done