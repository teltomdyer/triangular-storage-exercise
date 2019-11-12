#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

mix escript.build
./triangular_storage_exercise < ./test/resources/test_input.txt > ./test/resources/test_output.txt

diff --brief <(sort ./test/resources/test_output.txt) <(sort ./test/resources/test_output_expected.txt) >/dev/null
comp_value=$?

if [ $comp_value -eq 1 ]
then
    echo "EXPECTED_____"
    cat ./test/resources/test_output_expected.txt
    echo
    echo "ACTUAL______"
    cat ./test/resources/test_output.txt
    echo -e "\n${RED}E2E TEST FAILED${NOCOLOR}"
else
    cat ./test/resources/test_input.txt
    cat ./test/resources/test_output.txt
    echo -e "\n${GREEN}E2E TEST PASSED${NOCOLOR}"
fi