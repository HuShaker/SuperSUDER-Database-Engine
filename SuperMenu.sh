#!/bin/bash
source ./Extra_Functions/Error_Style
source ./Extra_Functions/Header_Note

#============================================================ configuration setting ==================================================================

clear
#export PS1="SuperSUDER >> " 
#export PS2=">> "
header_note
#============================================================ Super Menu ============================================================================
function fun_super_menu {
    
    
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
        1) fun_create_database ;;
        2) fun_list_databases ;;
        3) fun_drop_database ;;
        4) fun_connect_to_databases ;;
        5) exit ;;
        *) 
        clear
        header_note
        fun_error "Error: *** Wrong Choice *** "
        fun_super_menu
    esac
}
fun_super_menu



