#!/bin/bash
read -p "Input the domain name or IP you want to check" To_check
#Asks user for input and assigns answer to variable "To_check" 
printf "We will check the domain name or IP you specified \n"

#Add a loop here soon ™ to make it cleaner and automatize it

dig +short -t ANY $To_check > output.txt
sleep 5
dig +short -t ANY $To_check > output3.txt
#+short -t option allow to get only Answer part of dig standard output

sort -d output.txt > output2.txt
sort -d output3.txt > output4.txt
#Trick to sort content of the files by dictionary (eg : numbers at the beginning, then letter from A to Z and so on)

cmp output2.txt output4.txt
status=$?
if [[ $status = 0 ]]; then
    printf "DNS records has not changed! \n"
else
    printf "DNS records has changed! \n"
fi
rm output.txt output2.txt output3.txt output4.txt
#Credits https://stackoverflow.com/a/23429266 for checking difference between files

#Finish loop here