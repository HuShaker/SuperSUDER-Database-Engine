#!/usr/bin/bash



#fun_connect_to_databases (){
     #read -p "enter your database name :" -r connect_dbname
    #if [ -d ../Databases $connect_dbname ]; 
   # then
   # cd $connect_dbname

#}

 fun_connect_to_databases(){

   

echo " Select your database number from the minu :"


cd Databases
array=('ls -F | grep "/"')


select choice in ${array[*]}

do 
   if [$REPLY -gt ${#array[*]}]
   then 

      echo "$REPLY not on the minu "
      continue 

      else 
         cd Databases/${array[${REPLY}-1]}

         echo " you are connected to the database "

         echo
         break
       fi 

   done 
       echo
   }
fun_connect_to_databases 


#---------------------------------------------------------


function fun_table_menu {
    
    
    echo "+==================================+"
    echo "|          Super Menu              |"
    echo "+==================================+"
    echo "| Option |     Description         |"
    echo "+--------+-------------------------+"
    echo "|   1    | Create table            |"
    echo "|   2    | List tables             |"
    echo "|   3    | Drop table              |"
    echo "|   4    | Select from table       |"
    echo "|   5    | Delete from table       |"
    echo "|   6    | Update table            |"
    echo "|   7    |  Exit                   |"
    echo "+--------+-------------------------+"

    echo -e "Enter Choice: \c"
    read smenu
    case $smenu in
        1) fun_Create_table      ;;
        2) fun_list__tables      ;;
        3) fun_drop_table        ;;
        4) fun_select_from_table ;;
        5) fun_delete_table      ;;
        6) fun_update_table      ;;
        7_ Exit                  ;;
        *)
        
        clear
        header_note
        fun_error "Error: *** Wrong Choice *** "
        fun_super_menu
    esac
}
fun_table_menu


