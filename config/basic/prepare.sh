#/bin/bash
#
# Created by: AJ Canlas
# 

source $CONFIG_DIR/sysad.cfg

while [ `vagrant box list | grep ubuntu/focal64 | wc -l` -eq `echo 0` ]
do
    printf "Downloading basic box\t\t\t"
    vagrant box add ubuntu/focal64 &> /dev/null && success_output || error_output
done

