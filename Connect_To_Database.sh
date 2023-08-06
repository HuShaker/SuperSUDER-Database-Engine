#!/usr/bin/bash

# fun_connect_to_database () {

#     clear
#     fun_header_note
#     arr=(./Data/*)
#     echo "+==================================+"
#     echo "|       Available Databases        |"
#     echo "+==================================+"
#     counter=1
#     for db in "${arr[@]}"; do
#         db_name=$(basename "$db")
#         echo "|   $counter               $db_name "
#         echo "------------------------------------"
#         ((counter++))
#     done
#     echo
#     read -p "Enter the number of the database: " connect_number

#     if [[ $connect_number =~ ^[0-9]+$ ]]; then
#         if [ "$connect_number" -ge 1 ] && [ "$connect_number" -le "${#arr[@]}" ]; then
#             connect_db="${arr[$((connect_number - 1))]}"
#             cd ./Data
#             echo "successfully connect..."
#             sleep 2
#             clear
#             header_note
#             fun_table_menu
#         else
#             echo "Invalid database number."
#             sleep 2
#             fun_connect_to_database
#         fi
#     else
#         echo "Invalid input. Please enter a valid number."
#         sleep 2
#         fun_connect_to_database
#     fi

# }

fun_connect_to_databases() {

    echo
    echo "Select your database from the menu:"
    cd ./Data
    array=$(ls -d */ | sed 's/[/]//')
    select name in ${array[*]}; do
        if [[ -d $name ]]; then
            cd "$name"
            echo "You are connected to: $name"
            sleep 2
            clear
            fun_header_note
            fun_table_menu
            break
        else
            echo "Database does not exist. Please enter a valid name."
        fi
    done
}