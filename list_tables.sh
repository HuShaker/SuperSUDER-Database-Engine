#!/usr/bin/bash

fun_list__tables() {
  cd ./Data
     
     echo -e "here is the databases that were found " 

     echo 

      ls $pwd 

      echo 

      read -p "enter your database name :"
      clear
      
      ls $REPLY
      
      
}
fun_list__tables
