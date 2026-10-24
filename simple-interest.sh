#!/usr/bin/env bash

set -euo pipefail

read -r -p "Principal amount: " principal
read -r -p "Annual rate of interest (%): " rate
read -r -p "Time period (years): " time

awk -v principal="$principal" -v rate="$rate" -v time="$time" '
BEGIN {
    number = "^[0-9]+([.][0-9]+)?$"
    if (principal !~ number || rate !~ number || time !~ number) {
        print "Error: enter non-negative numbers for principal, rate, and time." > "/dev/stderr"
        exit 1
    }

    interest = principal * rate * time / 100
    total = principal + interest
    printf "Simple interest: %.2f\n", interest
    printf "Total amount: %.2f\n", total
}'
