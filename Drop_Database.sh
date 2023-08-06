#!/usr/bin/bash

function fun_drop_database {

    clear
    arr=(./Data/*)
    echo "+==================================+"
    echo "|       Available Databases        |"
    echo "+==================================+"
    counter=1
    for db in "${arr[@]}"; do
        db_name=$(basename "$db")
        echo "|   $counter               $db_name "
        echo "------------------------------------"
        ((counter++))
    done
    echo
    read -p "Enter the number of the database: " delete_number

    if [[ $delete_number =~ ^[0-9]+$ ]]; then

    else
        echo "Invalid input. Please enter a valid number."
        sleep 2
        fun_drop_database
    fi


}