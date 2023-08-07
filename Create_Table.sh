#!/usr/bin/bash


fun_create_table() {

    clear

    # Get Table name 
    echo -e "Enter The Table Name: \c" 
    read tableName
    # check the table name is valid or not
    if fun_validate_name "$tableName"; then
        # Valid Name
        #Check if the table exist or not
        if [ -e "./${tableName}_data" ] && [ -e "./${tableName}_metadata" ]; then
            echo "The Table already exists."
            sleep 2
            clear
            fun_create_table
        fi
        echo -e "Enter Columns Count: \c" 
        read columnCount
        if fun_validate_number "$columnCount"; then
            #Valid Columns Count
            metaName=""
            metaType=""
            pKey="no"
            metaPK=""
            for ((i = 1; i <= $columnCount; i++)); do
                echo -e "Enter Column Name: \c"
                read columnName
                if fun_validate_name "$columnName"; then
                    #Choose Type ("String","Number")
                    select type in "String" "Number"; do
                        case $type in
                            "String")
                                type="string"
                                break
                                ;;
                            "Number")
                                type="number"
                                break
                                ;;
                            *)
                                echo "Invalid selection. Please choose again."
                                sleep 2
                                clear
                                ;;
                        esac
                    done
                    #Choose Primary Key ("Yes","No")
                    if [ "$pKey" == "no" ]; then
                        echo "Is it Primary Key?"
                        select isPkey in "Yes" "No"; do
                            case $isPkey in
                                "Yes")
                                    isPkey="yes"
                                    pKey="yes"
                                    break
                                    ;;
                                "No")
                                    isPkey="no"
                                    break
                                    ;;
                                *)
                                    echo "Invalid selection. Please choose again."
                                    sleep 2
                                    clear
                                    ;;
                            esac
                        done
                    else
                        isPkey="no"
                        echo "There is already a primary key column"
                    fi

                else
                    #Invalid Cloumn Name
                    echo "Invalid input. Please enter a valid Cloumn Name."
                    sleep 2
                    clear
                    fun_create_table
                fi   
            done   
            touch "./${tableName}_data" "./${tableName}_metadata"
            echo "$metaName" >> "./${tableName}_metadata"
            echo "$metaType" >> "./${tableName}_metadata"
            echo "$metaPK" >> "./${tableName}_metadata"
            echo "Table created successfully..."
            sleep 5
            clear
            fun_table_menu
        else
            #Invalid Number
            echo "Invalid input. Please enter a valid Columns Count."
            sleep 2
            clear
            fun_create_table
        fi

    else
        #Invalid Name
        echo "Invalid input. Please enter a valid table name."
        sleep 2
        clear
        fun_create_table
    fi 
}


