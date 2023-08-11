#!/usr/bin/bash


fun_choose_table() {

    #clear
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
            
        else
            echo "Invalid table number."
            sleep 3
            fun_choose_table
        fi
    else
        echo "Invalid input. Please enter a valid number."
        sleep 3
        fun_choose_table
    fi

}


fun_select_row() {

    read -p "Enter the ID Number: " idNumber
    row=$(awk -F':' '$1=="'$idNumber'"' "./${current_table}_data") 
    if [ "$row" == "" ]; then
        
        echo "ID number not exist"
        sleep 3
        clear
    else
        clear
        echo "$row"
        echo
        sleep 3
    fi 

}

fun_select_by_id() {

    read -p "Enter the ID Number: " idNumber
    # Read Metadata
    column_names=($(head -n 1 "./${current_table}_metadata" | tr ':' ' '))

    # Select search column from table columns
    counter=1
    echo "╔══════════════════════════════════╗"
    echo "║           Column Names           ║"
    echo "╠════════╦═════════════════════════╣"
    echo "║ Option ║     Description         ║"
    echo "╠════════╩═════════════════════════╣"
    for column in "${column_names[@]}"; do
        echo "║   $counter               $column "
        if [ "$column" == "${column_names[-1]}" ]; then
            echo "╚══════════════════════════════════╝"
        else
            echo "╠══════════════════════════════════╣"
        fi
        ((counter++))
    done
    echo
    read -p "Enter the column number: " key_column_number

    if fun_validate_number "$key_column_number" && [ "$key_column_number" -ge 1 ] && [ "$key_column_number" -le "${#column_names[@]}" ]; then
            key_col_index=$((key_column_number - 1))
            key_column_name="${column_names[$key_col_index]}"
            row=$(awk -F':' '$1=="'$idNumber'"' "./${current_table}_data") 
            currentRow=($(echo "$row" | tr ':' ' '))
            clear
            echo "The ${key_column_name} is: ${currentRow[$key_col_index]}"
    else
        echo "Invalid column number..."
        sleep 3
        clear
        fun_Select_from_table
    fi

}

fun_Select_from_table() {

    select option in "All" "Row" "ByID"; do
        case $option in
            "All")
                fun_choose_table
                cat "${current_table}_data"
                sleep 3
                fun_table_menu
                ;;
            "Row")
                fun_choose_table
                fun_select_row
                fun_table_menu
                ;;
            "ByID")
                fun_choose_table
                fun_select_by_id
                fun_table_menu
                ;;
            *)
                echo "Invalid selection. Please choose again."
                sleep 2
                fun_table_menu
                ;;
        esac
    done
}
