#!/usr/bin/bash

# Prompt the user to enter the database name
read -p "Enter the database name: " db_name

# Function to create the database
create_database() {
     database_name="$1"
    if Validate_Name "$database_name"; then
        if [ -d "Databases/$database_name" ]; then
            echo "Error: Database already exists."
        else
            mkdir . ./../Databases/$database_name 
            echo "Database created successfully."
        fi
    else
        echo "Error: Invalid database name."
    fi
}

# Call the create_database function with the user-provided database name
create_database "$db_name"
