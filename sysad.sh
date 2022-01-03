#/bin/bash
# December 5,2021
# Created by: AJ Canlas

# configuration file
source /Users/aaroncanlas/Documents/Repository/sysad/config/sysad.cfg


# function to print the help function
help_function(){
  printf "usage: $0 [action] [lesson]
  \narguments:
  \tprepare\t\tprepares virtual machine
  \tenter\t\tenter virtual machine
  \tgrade\t\tgrade the activity
  \tclean\t\tclean virtual machine
  \nexample:\n\t$0 launch lesson1\n\t$0 clean lesson2\n"
}

# parsing argument
parse_argument_function(){
    case "$1" in
    "prepare" | "enter" | "grade" | "clean")
        cd $CONFIG_DIR
        bash $CONFIG_DIR/$2/$1.sh
        ;;
    "help")
        help_function
        ;;
    *)
        echo "Wrong argument"
        help_function
        ;;
    esac
}


# check arguments
check_arguments(){
    AP=0
    if [ -z $1 ]
    then
        echo "No action applied"
        help_function
    else
        for i in `ls $CONFIG_DIR`
        do
            if [ "$i" = "$2" ]
            then
                parse_argument_function $1 $2
                AP=1
                break
            fi
        done
        if [ $AP -eq 0 ]
        then
            printf "$2 is not availble\n"
		    help_function
        fi
    fi
}


check_arguments $1 $2