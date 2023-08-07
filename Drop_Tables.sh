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
    read -p "Enter the number of the Table: " delete_number

    if [[ $delete_number =~ ^[0-9]+$ ]]; then
        if [ "$delete_number" -ge 1 ] && [ "$delete_number" -le "${#mytables[@]}" ]; then
            deleted_table="${mytables[$((delete_number - 1))]}"
            rm -r "${deleted_table}_metadata" "${deleted_table}_data"
            clear
            echo "Table ${deleted_table} has been deleted."
            sleep 3
            clear
            fun_table_menu
        else
            echo "Invalid table number."
            sleep 3
            fun_drop_table
        fi
    else
        echo "Invalid input. Please enter a valid number."
        sleep 3
        fun_drop_table
    fi
}