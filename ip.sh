#!/bin/bash

function get_public_ip() {

response=$(curl --silent "$1")

    if [ $? -eq 0 ]; then
        echo "Your public ip is: "
        echo "$response"
    else
        response=$(curl --silent "$2")

        if [ $? -eq 0 ]; then
            echo "Your ip is: "
            echo "$response"
        else
            response=$(curl --silent "$3" | grep -oP '(?<=<data>).*?(?=</data>)')

            if [ $? -eq 0 ]; then
                echo "Your ip is: "
                echo "$response"
            else
                echo "Failed to connect to $1, $2 and $3"

            fi
        fi
    fi

}

get_public_ip "https://ipv4.myip.coffee" "https://4.ipwho.de/ip" "https://artemislena.eu/services/whoareyou.html"
