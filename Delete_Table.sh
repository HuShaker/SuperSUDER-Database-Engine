#!/usr/bin/bash

delete_one_row(){

    fun_choose_table
    read -p "Enter the ID Number: " idNumber
    row=$(awk -F':' '$1=="'$idNumber'"' "./${current_table}_data") 
    if [ "$row" == "" ]; then
        

    fi 
}





