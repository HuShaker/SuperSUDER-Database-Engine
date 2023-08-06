#!/usr/bin/bash


fun_create_table() {

    clear

    # Get Table name 
    echo -e "Enter The Table Name: \c" 
    read tableName
    # check the table name is valid or not
    if fun_validate_name "$tableName"; then
        # Valid Name
        #Check if the table exist or not
        if [ -e "./${tableName}_data" ] && [ -e "./${tableName}_metadata" ]; then
            echo "The Table already exists."
            sleep 2
            clear
            fun_create_table
        fi
        echo -e "Enter Columns Count: \c" 
        read columnCount
        if fun_validate_number "$columnCount"; then
            
        else
            #Invalid Number
            echo "Invalid input. Please enter a valid Columns Count."
            sleep 2
            clear
            fun_create_table
        fi

    else
        #Invalid Name
        echo "Invalid input. Please enter a valid table name."
        sleep 2
        clear
        fun_create_table
    fi 
}


