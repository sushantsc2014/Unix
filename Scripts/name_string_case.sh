##################
#
# Requirement:
#	You will read a string in '<name>:<name>:<name>:....' (colon seperated)
#	If given string starts with lower case letter, print all the names starting with lower case
#	If given string starts with upper case letter, print all the names starting with upper case
#	Exmaple string- sushant:Subbhash:sunita:chavare
#	As string starts with 's' small letter, expected o/print
#	sushant
#	sunita
#	chavare
###################

echo "Please enter string"
read string
echo "Entered string is-->" $string
no_of_fields=`echo "$string"|awk -F ":" '{print NF}'`
first_char=`echo ${string:0:1}`
#echo $no_of_fields
echo "First character of input string:" $first_char
if [[ $first_char =~ [a-z] ]];then
echo "First character of input string is lower-case."
        for i in $(eval echo "{1..$no_of_fields}")
        do
                name=`echo $string|cut -d ":" -f$i`
                first_char_name=`echo ${name:0:1}`
                if [[ $first_char_name =~ [a-z] ]];then

                        echo $name
                fi
        done
elif [[ $first_char =~ [A-Z] ]];then
echo "UPPER-CASE START"
        for i in $(eval echo "{1..$no_of_fields}")
        do
                name=`echo $string|cut -d ":" -f$i`
                first_char_name=`echo ${name:0:1}`
                if [[ $first_char_name =~ [A-Z] ]];then

                        echo $name
                fi
        done
else
echo "Starting with digit or special symbols"
fi