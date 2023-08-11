#!/usr/bin/bash

delete_one_row(){

    fun_choose_table
    read -p "Enter the ID Number: " idNumber
    row=$(awk -F':' '$1=="'$idNumber'"' "./${current_table}_data") 
    if [ "$row" == "" ]; then
        
        echo "ID number not exist"
        sleep 3
        clear
    else
        clear
        sed -i "/$idNumber/d" "./${current_table}_data"
        echo "the row \" $idNumber \" has been deleted..."
        sleep 3
        #clear
    fi 
}
elete_multi_row(){

    fun_choose_table
    read -p "Enter the first ID Number: " first_ID_Number
    read -p "Enter the last ID Number: " last_ID_Number
    fRow=$(awk -F':' '$1=="'$first_ID_Number'"' "./${current_table}_data")
    lRow=$(awk -F':' '$1=="'$last_ID_Number'"' "./${current_table}_data")

    if [ "$fRow" == "" ] || [ "$lRow" == "" ]; then
        
        echo "ID number not exist"
        sleep 3
        clear
    else
        clear
        sed -i "/$first_ID_Number/,/$last_ID_Number/d" "./${current_table}_data"
        echo "the rows have been deleted..."
        sleep 3
        #clear
    fi 
}

fun_delete_from_table() {

    select option in "One Row" "Multi Rows" "All Rows"; do
        case $option in
            "One Row")
                delete_one_row
                sleep 3
                fun_table_menu
                ;;
            "Multi Rows")
                delete_multi_row
                fun_table_menu
                ;;
            "All Rows")
                echo -n "" > "./${current_table}_data"
                 echo "the rows have been deleted..."
                sleep 3
                clear
                fun_table_menu
                ;;
            *)
                echo "Invalid selection. Please choose again."
                sleep 3
                clear
                fun_table_menu
                ;;
        esac
    done
}

