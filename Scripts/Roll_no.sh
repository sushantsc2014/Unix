#!/bin/ksh

### Sushant- 14-Dec-2020 1406 EST
HOME_DIR=/tmp/TEST/
myFile=$HOME_DIR/student_list.txt
roll_no_file=$HOME_DIR/new_file.txt


if [ ! -d $HOME_DIR ];then
	mkdir -p $HOME_DIR;chmod -R 777 $HOME_DIR   #This will create required directory if does not exists.
fi

if [[ $# -eq 0 ]];then  # Will check for al least one argument
	echo "At least one argument you should pass- Admission or Report (case sensitive)"
	exit 0

elif [[ "$1" == "Admission" ]];then
	if [ "$#" -eq 1 ];then 
		if [ -e $myFile ]; then
			myArray=(`cat $myFile`)
			#echo ${myArray[@]}
			no_of_students=`wc -l $myFile|awk '{print $1}'`
			#echo $no_of_student
			var_no=`expr $no_of_students - 1`
				for i in $(eval echo "{0..$var_no}")
				do
					#echo $i
					roll_no=`expr $i + 1`
					echo $roll_no":"${myArray[$i]}>>$roll_no_file
				done
		else
			echo "Student list file does not already exist. You can pass studnet name, branch name if this is very first time you are running script OR you can place student list with in required format inside $HOME_DIR"
			exit 0 
		fi
	
			
	elif [ "$#" -eq 2 ];then
		echo "Only student name is passed as an argument for admission, to generate roll number, please pass Branch as well."
		exit 0
	
	elif [ "$#" -eq 3 ];then

		if [ ! -e $myFile ];then
			touch $myFile;chmod 777 $myFile  #Will create required file to store student details
		fi
	
		echo $2":"$3>>$myFile    #Inserting data in file

		if [ ! -e $roll_no_file	];then    # When running for first student registry, will create file.
			touch $roll_no_file;chmod 777 $roll_no_file
			myArray=(`cat $myFile`)
			#echo ${myArray[@]}
			no_of_students=`wc -l $myFile|awk '{print $1}'`
			#echo $no_of_student
			var_no=`expr $no_of_students - 1`
				for i in $(eval echo "{0..$var_no}")
				do
					#echo $i
					roll_no=`expr $i + 1`
					echo $roll_no":"${myArray[$i]}>>$roll_no_file
				done
		else 
			last_roll_no=`wc -l $roll_no_file|awk '{print $1}'`
			next_roll_no=`expr $last_roll_no + 1`
			echo $next_roll_no":"$2":"$3>>$roll_no_file
		fi
	fi
	echo "Student details added successfully and roll no is assigned"

elif [[ "$1" == "Report" ]];then
	roll_no_file=$HOME_DIR/new_file.txt
	if [ ! -e $roll_no_file ];then
		echo "It seems either no students are registered or roll no is not yet generated"
		exit 0
	else
		echo "Report is sent over mail. Please check."
		echo "<table border=1> <tr>
              <th>Roll_No</th>
			  <th>Name</th>
			  <th>Branch</th>
			  </tr>">$HOME_DIR/roll_no_output.html

		myArray=(`cat $roll_no_file`)			  
		for i in "${myArray[@]}"
		do
			echo "<tr><td>">>$HOME_DIR/roll_no_output.html
			echo "`echo $i|cut -d ":" -f1`">>$HOME_DIR/roll_no_output.html
			echo "</td>">>$HOME_DIR/roll_no_output.html
			echo "<td>">>$HOME_DIR/roll_no_output.html
			echo "`echo $i|cut -d ":" -f2`">>$HOME_DIR/roll_no_output.html
			echo "</td>">>$HOME_DIR/roll_no_output.html
			echo "<td>">>$HOME_DIR/roll_no_output.html
			echo "`echo $i|cut -d ":" -f3`">>$HOME_DIR/roll_no_output.html
			echo "</td>">>$HOME_DIR/roll_no_output.html
			echo "</tr>">>$HOME_DIR/roll_no_output.html
		done
		echo "</table>">>$HOME_DIR/roll_no_output.html
		(echo "To: sc59605@imcnam.ssmb.com"
		echo "Subject: Pleae find roll number assigned "
		echo "MIME-Version: 1.0"
		echo "Content-Type: text/html"
		echo "Please find below roll number assigned</br></br>"
		cat $HOME_DIR/roll_no_output.html) | sendmail -t	
	fi
else
	echo "Incorrect arguments passed while running the script"
fi