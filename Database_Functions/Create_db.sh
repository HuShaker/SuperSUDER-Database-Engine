#!/usr/bin/bash

export LC_COLLATE=C
shopt -s extglob

function Validate_Name() {
    echo "$1" | grep -q '^[_[:alpha:]][_[:alpha:][:digit:]]*$' && echo "True" || echo "False"
}

Validate_Name $1

# Prompt the user to enter the database name
read -p "Enter the database name: " db_name

# Function to create the database
function create_database() {
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
