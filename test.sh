#!/usr/bin/bash

fun_connect_to_databases() {
    echo "select your database from the menu :"

     cd ./Data

      ls -d */ | sed 's/[/]//'

    echo  "enter the name :" 
    read name 

  if [[ -d $name ]];then 
   
   cd $name
    echo "you are connected to:" $name 

 else 
    echo "not exist ,please enter a valid name :"

 fi  

}
fun_connect_to_databases