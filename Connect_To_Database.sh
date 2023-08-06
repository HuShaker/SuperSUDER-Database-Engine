#!/usr/bin/bash

fun_connect_to_database () {

    clear
    fun_header_note
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
    read -p "Enter the number of the database: " connect_number

    if [[ $connect_number =~ ^[0-9]+$ ]]; then
        if [ "$connect_number" -ge 1 ] && [ "$connect_number" -le "${#arr[@]}" ]; then
            connect_db="${arr[$((connect_number - 1))]}"
            cd ./Data
            $SHELL
            echo ""
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




    cd ./Data
    $SHELL
    echo ""


}