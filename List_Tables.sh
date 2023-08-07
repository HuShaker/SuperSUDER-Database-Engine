#!/usr/bin/bash

fun_list_tables() {
    
    clear
    echo  "Here is the tables that were found: " 
    echo 
    ls -F | grep -v '_metadata' | sed 's/_data$//'
    echo 
    sleep 2
    fun_table_menu 
      
}