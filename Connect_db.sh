#!/usr/bin/bash

fun_connect_to_databases() {

    echo -e " \n Select your database number from the minu : \c"
    read ch
    cd Data/
    array=$(ls -d */ | sed 's/[/]//')

    select choice in ${array[*]}

    do 
        if [ $ch -gt ${#array[*]} ] then 

            echo "$ch not on the menu "
            continue 

        else 
            cd Data/${array[${ch}-1]}

            echo " you are connected to the database "
            break
        fi 

    done 

}
fun_connect_to_databases