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
        if [ "$delete_number" -ge 1 ] && [ "$delete_number" -le "${#arr[@]}" ]; then
            deleted_db="${arr[$((delete_number - 1))]}"
            rm -r "$deleted_db"  # Delete the database directory
            clear
            echo "Database '$(basename "$deleted_db")' has been deleted."
            sleep 2
            clear
            fun_header_note
            fun_super_menu
        else
            echo "Invalid database number."
            sleep 2
            fun_drop_database
        fi
    else
        echo "Invalid input. Please enter a valid number."
        sleep 2
        fun_drop_database
    fi


}