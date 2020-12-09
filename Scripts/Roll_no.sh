if [[ $# -eq 0 ]];then
	echo "At least one argument you should pass"
	exit 0

elif [[ "$1" == "Admission" ]];then
	myFile=$HOME/TEST/student.txt
	roll_no_file=$HOME/TEST/new_file.txt

	if [ ! -e $myFile ];then
		touch $myFile;chmod 777 $myFile
	fi
	
	echo $2":"$3>>$myFile

	if [ ! -e $roll_no_file	];then
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
	
	echo "Student details added successfully and roll no is assigned"

elif [[ "$1" == "Report" ]];then
	if [ ! -e $roll_no_file ];then
		echo "It seems either no students are registered or roll no is not yet generated"
		exit 0
	else
		cat $roll_no_file
	fi
fi