#!/usr/bin/bash
PS3 = "Type Your DB NUmber to connect with :"

echo 

echo " Select your database number from the minu :"

echo 
cd ./databases
array=('ls -F | grep "/"')


select choise in ${array[*]}

do 
   if [$REPLY -gt ${#array[*]}]
   then 

      echo "$REPLY not on the minu "
      continue 

      else 
         cd ./databases/${array[${REPLY}-1]}

         echo " you are connected to the database "

         echo
         break
       fi 

   done 
       echo

cd -


#---------------------------------------------------------





