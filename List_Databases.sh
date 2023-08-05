#!/usr/bin/bash

function fun_list_databases {

    clear
    fun_header_note
    arr=(./Data/*)
    echo "+==================================+"
    echo "|           Avail DBs              |"
    echo "+==================================+"
    counter=1
    for db in "${arr[@]}"; do
        db_name=$(basename "$db")
        echo "|   $counter               $db_name "
        echo "------------------------------------"
        ((counter++))
    done
    echo
    sleep 3
    fun_super_menu
}
