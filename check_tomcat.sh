#!/bin/bash

if ps aux | grep "[j]ava.*tomcat" > /dev/null; then
    echo "Tomcat is running."
    exit 0  # Success
else
    echo "Tomcat is NOT running."
    exit 1  # Failure
fi


