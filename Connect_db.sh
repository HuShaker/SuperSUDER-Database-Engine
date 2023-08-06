#!/usr/bin/bash

fun_connect_to_databases() {
    echo "Select your database from the menu:"
    cd ./Data
    array=$(ls -d */ | sed 's/[/]//')
    select name in ${array[*]}; do
        if [[ -d $name ]]; then
            cd "$name"
            echo "You are connected to: $name"
            break
        else
            echo "Database does not exist. Please enter a valid name."
        fi
    done
}

fun_connect_to_databases
