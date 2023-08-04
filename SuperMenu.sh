#!/bin/bash
#SuperMenu

#configuration setting
clear
#export PS1="SuperSUDER >> " 
#export PS2=">> "

echo    "╔═════════════════════════════════════════════════════════════════════════════╗"
echo    "║                              Hello Suders !!                                ║"
echo    "║  Note: Now you have become Suder, but of course, you are not like Eng.Mina  ║"
echo -e "╚═════════════════════════════════════════════════════════════════════════════╝\n"

#echo -e "\e[5m \033[31m   Error: Something went wrong. \033[31m  \e[0m"


function super_menu {
    echo "+==================================+"
    echo "|          Super Menu              |"
    echo "+==================================+"
    echo "| Option |     Description         |"
    echo "+--------+-------------------------+"
    echo "|   1    | Create Database         |"
    echo "|   2    | List Databases          |"
    echo "|   3    | Drop Database           |"
    echo "|   4    | Connect To Databases    |"
    echo "|   5    | exit                    |"
    echo "+--------+-------------------------+"

    echo -e "Enter Choice: \c"
    read smenu
    case $smenu in
        1) echo "create_database" ;;
        2) list_databases ;;
        3) drop_database ;;
        4) connect_to_databases ;;
        5) exit ;;
        *) 
        # \033[31m ==> For Red Color &  \e[5m ==> for Animation
        echo -e "\e[5m   \033[31m    Error: *** Wrong Choice. ***   \033[31m  \e[0m"


        super_menu
    esac
}
super_menu



