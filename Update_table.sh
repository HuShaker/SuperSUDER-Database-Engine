#!/usr/bin/bash

fun_update_table() {
  
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
            #Get Table Name
            current_table="${mytables[$((table_number - 1))]}"
            #Print Table content
            clear
            cat "./${current_table}_data"
            echo
            
            read -p "Enter ID Number that you want to edit: " idNumber
            table_Data=($(sed -n '1p' "./${current_table}_data" | tr ':' ' '))
            value=$(awk -F':' '$1=="'$idNumber'"' "./${current_table}_data")
            if [ "$value" == "" ]; then
                echo "\"$idNumber\" doesn't exist"
                sleep 3
                fun_update_table
            else
                read -p "Enter the value that you want to update: " oldValue
                currentRow=($(echo "$value" | tr ':' ' '))
                if [[ "${currentRow[@]}" =~ "$oldValue" ]]; then
                    read -p "Enter the new value: " newValue
                    #Get The index of old value
                    for index in "${!currentRow[@]}"; do
                        if [ "${currentRow[$index]}" = "$oldValue" ]; then
                            fIndex=$index
                            data_types=($(sed -n '2p' "./${current_table}_metadata" | tr ':' ' '))
                        fi
                        
                    done
                    if [ "${data_types[$fIndex]}" == "string" ]; then
                        if fun_validate_name "$oldValue" && fun_validate_name "$newValue"; then
                            #rownum=$(awk -v val="$value" '$0 ~ val {print NR}' "./${current_table}_metadata")
                            #echo "$rownum"
                            #sed -i "${rownum}s/$oldValue/$newValue/" "./${current_table}_data" 
                            sed -i "s/$oldValue/$newValue/" "./${current_table}_data" 
                            echo "Row Updated Successfully..."
                            sleep 3
                            clear
                            fun_table_menu
                        else
                            echo "Your Values are not valid"
                            sleep 3
                            clear
                            fun_update_table
                        fi
                    else
                        echo "Try again"
                        sleep 3
                        fun_update_table   
                    fi 

                else
                    echo "\"$oldValue\" doesn't exist"
                    sleep 3
                    fun_update_table
                fi
            fi
        else
        echo "Invalid table number."
        sleep 3
        fun_update_table
        fi
    else
        echo "Invalid input. Please enter a valid number."
        sleep 3
        fun_update_table
    fi
}