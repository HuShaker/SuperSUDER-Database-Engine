#!/bin/bash

fun_insert_table() {

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
    read -p "Enter the number of the Table: " table_number

    if [[ $table_number =~ ^[0-9]+$ ]]; then
        if [ "$table_number" -ge 1 ] && [ "$table_number" -le "${#mytables[@]}" ]; then
            current_table="${mytables[$((table_number - 1))]}"


        else
            echo "Invalid table number."
            sleep 3
            fun_insert_table
        fi
    else
        echo "Invalid input. Please enter a valid number."
        sleep 3
        fun_insert_table
    fi

}