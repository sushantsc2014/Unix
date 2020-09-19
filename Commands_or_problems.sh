## 1. SCP command to copy files from one server to another

$scp sc59605@ctoctxmwap3u:/tmp/checkout_20.3/* /tmp/check/
$hostname
ctoctxswap4u

## 2. Finding links created in last 48 hrs.

$cd ${required_dir}
$find -maxdepth 1 -type l -mtime -2 -exec ls -lrt {} \;| awk '{print $9$10$11}'
./cs_tx -> r_cstx_v5_228
./tx_dr -> r_txdr_v5_81_2


## 3. df command
$df -kh /   ##used space for root. Showed used space 88% (-h: human readable form, -k: block size of 1 kb)

## 4. du command
$du -sh /home/pctlness ##to check space used by file or directory (-s : summarized view).


## 5. Hostname command
$hostname -s   ##short version of hostname

## Recently RHEL upgraded from version 6 to version 7. So 'hostname' command in version 6 is equivalent to 'hostname -s' in version 7. This caused our scripts to update accordingly.



## 6. Check RHEL version
$hostnamectl
$cat /etc/redhat-release


## 7. Check instances are up or not

$name_of_instances=("CSTX-1" "CSTX-2" "CSTX-3" "CSTX-4")
$echo ${name_of_instances[@]}

for tomcat in ${name_of_instances[@]};do
var=`ps -ef|grep -i $tomcat|grep -v grep|wc -l`
	if [ $var -eq 1 ];then
		echo "$tomcat instance is up and running"
	else
		echo "Please check on instance $tomcat"
	fi
done


## 8. Random number
$chef -i 1-100 -n 1  #from 1 to 100, generates 1 rando number
$chef -i 1-150 -n 2 #generated two random numbers from 1 to 150



