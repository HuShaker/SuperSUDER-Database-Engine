#!/usr/bin/bash


fun_create_table() {

    clear

    # Get Table name 
    echo -e "Enter The Table Name: \c" 
    read tableName
    # check the table name is valid or not
    if fun_validate_name "$tableName"; then
        

    else
        #Invalid Name
        echo "Invalid input. Please enter a valid table name."
        sleep 2
        clear
        fun_create_table
    fi 
}


