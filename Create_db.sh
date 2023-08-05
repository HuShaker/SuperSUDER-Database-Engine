#!/usr/bin/bash

# Function to create the database
Create_database() {
    # Prompt the user to enter the database name
    read -p "Enter the database name: " db_name

    if  Validate_Name "$db_name" ; then
       if [ -d "./Data/$db_name" ]; then
            echo "Error: Database already exists."
        else
            mkdir "./Data/$db_name"
            echo "Database created successfully."
        fi
    else
        echo "Error: Invalid database name."
    fi
}
Create_database