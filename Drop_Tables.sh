#!/usr/bin/bash

fun_drop_table() {

    clear
    mytables=($(ls -F | grep -v '_metadata' | sed 's/_data$//'))
    counter=1
    echo "+==================================+"
    echo "|       Available Tables           |"
    echo "+==================================+"
    for table in "${mytables[@]}"; do
        echo "|   $counter               $table "
        echo "------------------------------------"
        ((counter++))
    done
    echo

}