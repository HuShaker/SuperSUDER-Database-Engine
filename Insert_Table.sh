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
            # Split the columns into arrays & Replace : with spaces
            colnames_array=(${colnames//:/ })
            coltypes_array=(${coltypes//:/ }) 
            colpk_array=(${colpk//:/ })
            #columns count
            columns_count="${#array[@]}"
            for ((i = 1; i <= $columns_count; i++)); do
                #Check the current column is string or int 
                strFlag=0
                do
                    read -p "Enter the \"${colnames_array[$((i - 1))]}\": " current_column
                    if [ "${coltypes_array[$((i - 1))]}" == "string" ]; then
                        #Check the string is valid or not
                        if fun_validate_name "$current_column"; then

                            strFlag=1
                        else
                            echo "This column should be only \""${coltypes_array[$((i - 1))]}"\"" 
                            echo
                        fi  
                    elif [ "${coltypes_array[$((i - 1))]}" == "number" ]; then
                        #Check the number is valid or not
                        if fun_validate_number "$current_column"; then
                            strFlag=1
                        else
                            echo "This column should be only \""${coltypes_array[$((i - 1))]}"\"" 
                            echo
                        fi
                    else 
                        echo "This column should be only \""${coltypes_array[$((i - 1))]}"\"" 
                        echo
                    fi
                done while [ "$strFlag" == 1 ]


            done



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