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


    cd ./Data
    $SHELL
    echo ""


}