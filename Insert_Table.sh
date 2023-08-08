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

            # Extract line 1 
            sed -n '1p;1q' "${current_table}_metadata" > tmpfile
            read -r colnames < tmpfile
            # Extract line 2
            sed -n '2p;2q' "${current_table}_metadata" > tmpfile
            read -r coltypes < tmpfile 
            # Extract line 3
            sed -n '3p;3q' "${current_table}_metadata" > tmpfile
            read -r colpk < tmpfile
            rm tmpfile
            # Split the columns into arrays 
            colnames_array=(${colnames//:/ })
            coltypes_array=(${coltypes//:/ }) 
            colpk_array=(${colpk//:/ })
            # Print out the arrays
            echo "Column Names:"
            echo ${colnames_array[0]}
            echo "Column Types:" 
            echo ${coltypes_array[0]}
            echo "Primary Keys:"
            echo ${colpk_array[0]}


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