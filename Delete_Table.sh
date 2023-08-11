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





