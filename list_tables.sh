#!/usr/bin/bash

fun_list__tables() {
  
     clear
     echo  "here is the tables that were found " 

     echo 

     ls -F |grep  -v  'metadata | sed  ' s/_data$// '

     echo 
     sleep 2

    fun_table_menu 
      
}
fun_list__tables
