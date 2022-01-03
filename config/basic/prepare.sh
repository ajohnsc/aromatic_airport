#/bin/bash
#
# Created by: AJ Canlas
# 

source sysad.cfg

until [ `vagrant box list | grep ubuntu/focal64 | wc -l` ]
do
    printf "Downloading basic box"
    vagrant box add ubuntu/focal64 &> /dev/null && success_output || error_output
done

