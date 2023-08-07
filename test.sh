#!/bin/bash

select_all_table () {
    cd ./Data/shereen
    tables=($(ls -F | grep -v 'metadata$' | sed 's/_data$//'))

    if [[ ${#tables[@]} -eq 0 ]]; then
        echo "No tables found in the shereen directory."
        return
    fi

    echo "Tables:"
    printf '%s\n' "${tables[@]}"

    echo -e "Enter the name of the table you want to select from: \c"
    read -r tname

    if [[ " ${tables[*]} " == *" $tname "* ]]; then
        if [[ -f ${tname}_data.txt ]]; then
            cat "${tname}_data.txt"
        else
            echo "Error displaying table ${tname}_data.txt"
        fi
    else
        echo "Table ${tname} does not exist."
    fi
}

select_all_table

#--------------------------------------

#test2
