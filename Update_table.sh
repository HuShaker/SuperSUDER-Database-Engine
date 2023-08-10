#!/usr/bin/bash
fun_update_table () {
  echo -e "Enter Table Name: \c"
  read tName
  echo -e "Enter Condition Column name: \c"
  read column
  fid=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$column'") print i}}}' $tName)
  if [[ $fid == "" ]]
  then
    echo "Not Found"

  fun_table_menu
  else
    echo -e "Enter Condition Value: \c"
    read val
    res=$(awk 'BEGIN{FS=":"}{if ($'$fid'=="'$val'") print $'$fid'}' $tName 2>>./.error.log)
    if [[ $res == "" ]]
    then
      echo "Value Not Found"

      fun_table_menu

    else
      echo -e "Enter FIELD name to set: \c"
      read setField
      setFid=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$setField'") print i}}}' $tName)
      if [[ $setFid == "" ]]
      then
        echo "Not Found"

        fun_table_menu

      else
        echo -e "Enter new Value to set: \c"
        read newValue
        NR=$(awk 'BEGIN{FS="|"}{if ($'$fid' == "'$val'") print NR}' $tName 2>>./.error.log)
        oldValue=$(awk 'BEGIN{FS="|"}{if(NR=='$NR'){for(i=1;i<=NF;i++){if(i=='$setFid') print $i}}}' $tName 2>>./.error.log)
        echo $oldValue
        sed -i ''$NR's/'$oldValue'/'$newValue'/g' $tName 2>>./.error.log
        echo "Row Updated Successfully"

        fun_table_menu
      fi
    fi
  fi

}