#!/usr/bin/bash

Validate_Name() {
    # Regular expression to check for valid name (starts with a letter and contains only letters, numbers, or underscores)
    pattern="^[a-zA-Z][a-zA-Z0-9_]*$"

    if [[ $1 =~ $pattern ]]; then
        return 0
    else
        return 1
    fi
}

# Function to create the database
Create_database() {
    # Prompt the user to enter the database name
read -p "Enter the database name: " db_name

     database_name="$1"
    if Validate_Name "$database_name"; then
        if [ -d "Databases/$database_name" ]; then
            echo "Error: Database already exists."
        else
            mkdir "Databases/$database_name"
            echo "Database created successfully."
        fi
    else
        echo "Error: Invalid database name."
    fi
}

# Call the create_database function with the user-provided database name
Create_database 
