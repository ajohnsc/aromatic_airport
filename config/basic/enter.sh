#/bin/bash
#
# Created by: AJ Canlas
# 

source sysad.cfg
cd $CONFIG_DIR/basic

while [ `vagrant status | grep basic | grep running | wc -l` -eq `echo 0` ]
do
    printf "Starting basic box\t\t\t"
    vagrant up &> /dev/null && success_output || error_output
done

echo "Connecting to basic box"
vagrant ssh 