#!/usr/bin/bash

fun_list__tables() {
  cd ./Data
     
     echo -e "here is the databases were found " 

     echo 

      ls $pwd 

      echo 

      read -p "enter your database name :"
      clear
      
      ls $REPLY
      
      cat 
}
fun_list__tables
