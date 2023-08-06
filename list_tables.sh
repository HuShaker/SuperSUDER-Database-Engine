#!/usr/bin/bash

fun_list__tables() {
  
     
     echo  "here is the databases that were found " 

     echo 

      ls -d */ | sed 's/[/]// '

      echo 
      sleep 2

    fun_table_menu 
      
}
fun_list__tables
