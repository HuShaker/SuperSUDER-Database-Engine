#!/usr/bin/bash
source ./Error_Style.sh
source ./Header_Note.sh
source ./Create_Database.sh
#source ./test

#============================================================ Functions ==================================================================

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
        1) fun_create_database      ;;
        2) fun_list_databases       ;;
        3) fun_drop_database        ;;
        4) fun_connect_to_databases ;;
        5) exit                     ;;
        *) 
        clear
        fun_header_note
        fun_error "Error: *** Wrong Choice *** "
        fun_super_menu
    esac
}

function fun_table_menu {
    
    
    echo "+==================================+"
    echo "|          Super Menu              |"
    echo "+==================================+"
    echo "| Option |     Description         |"
    echo "+--------+-------------------------+"
    echo "|   1    | Create table            |"
    echo "|   2    | List tables             |"
    echo "|   3    | Drop table              |"
    echo "|   4    | Select from table       |"
    echo "|   5    | Delete from table       |"
    echo "|   6    | Update table            |"
    echo "|   7    |  Exit                   |"
    echo "+--------+-------------------------+"

    echo -e "Enter Choice: \c"
    read smenu
    case $smenu in
        1) fun_Create_table      ;;
        2) fun_list__tables      ;;
        3) fun_drop_table        ;;
        4) fun_select_from_table ;;
        5) fun_delete_table      ;;
        6) fun_update_table      ;;
        7) exit                  ;;
        *)
        clear
        header_note
        fun_error "Error: *** Wrong Choice *** "
        fun_super_menu
    esac
}
#============================================================ Starting ============================================================================

clear
fun_header_note
fun_super_menu



