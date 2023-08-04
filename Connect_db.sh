#!/usr/bin/bash

PS3 = "Type Your DB NUmber to connect with :"

echo 

echo " Select your database number from the minu :"

echo 
cd . ./databases
array=('ls -F | grep "/"')


select choise in ${array[*]}

do 
   if [$REPLY -gt ${#array[*]}]
   then 

      echo "$REPLY not on the minu "
      continue 

      else 
         cd ../databases/${array[${REPLY}-1]}

         echo " you are connected to the database "

         echo
         break
       fi 

   done 
       echo

cd -


#---------------------------------------------------------



#do another minu for the feature in the databse 


echo 
PS3= "Type your choice number :"

 Select choice in create_table list_table Drop_table insert_in_table select_from_table Delete_from_table update_from_table 
  do 

   case $choise in 

      create_table )

      echo "creating table " 
      . ./create_Table.sh 
      ;;