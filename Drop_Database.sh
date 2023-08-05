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

}