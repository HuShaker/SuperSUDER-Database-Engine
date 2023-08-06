#!/usr/bin/bash

fun_list__tables() {
  
     
     echo  "here is the tables that were found " 

     echo 

      ls -F| grep "*"


      echo 
      sleep 2

    fun_table_menu 
      
}
fun_list__tables
