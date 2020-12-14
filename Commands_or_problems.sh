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

## 9. Deploy .war files on tomcat instances

$ cd /opt/middleware/tomcat/instances
$ for TOMCAT in `ls`;do
	rm -rf $TOMCAT/webapps/{webapp1,webapp2,webapp3}
	unzip -x /prodtx/gi5/gi/release/war/webapp1.war -d $TOMCAT/webapps/webapp1
	unzip -x /prodtx/gi5/gi/release/war/webapp2.war -d $TOMCAT/webapps/webapp1
	unzip -x /prodtx/gi5/gi/release/war/webapp3.war -d $TOMCAT/webapps/webapp1
done;


## 10. Requirement

######
file name- hosts_access_log_00.txt, contenet of file given

unicomp6.unicomp.net - - [01/Jul/1995:00:00:06 -0400] "GET /shuttle/countdown/ HTTP/1.0" 200 3985
burger.letters.com - - [01/Jul/1995:00:00:11 -0400] "GET /shuttle/countdown/liftoff.html HTTP/1.0" 304 0
burger.letters.com - - [01/Jul/1995:00:00:12 -0400] "GET /images/NASA-logosmall.gif HTTP/1.0" 304 0
burger.letters.com - - [01/Jul/1995:00:00:12 -0400] "GET /shuttle/countdown/video/livevideo.gif HTTP/1.0" 200 0
d104.aa.net - - [01/Jul/1995:00:00:13 -0400] "GET /shuttle/countdown/ HTTP/1.0" 200 3985
unicomp6.unicomp.net - - [01/Jul/1995:00:00:14 -0400] "GET /shuttle/countdown/count.gif HTTP/1.0" 200 40310
unicomp6.unicomp.net - - [01/Jul/1995:00:00:14 -0400] "GET /images/NASA-logosmall.gif HTTP/1.0" 200 786
unicomp6.unicomp.net - - [01/Jul/1995:00:00:14 -0400] "GET /images/KSC-logosmall.gif HTTP/1.0" 200 1204
d104.aa.net - - [01/Jul/1995:00:00:15 -0400] "GET /shuttle/countdown/count.gif HTTP/1.0" 200 40310
d104.aa.net - - [01/Jul/1995:00:00:15 -0400] "GET /images/NASA-logosmall.gif HTTP/1.0" 200 786

GET request for .gif files with http reqest response 200, all files should go in one other file. No duplicates.

Expected o/p in other file:

KSC-logosmall.gif
NASA-logosmall.gif
count.gif
livevideo.gif


[sushantsc2014@unix-box ~]$ grep GET hosts_access_log_00.txt|grep 200|grep gif|awk '{print $7}'|awk -F "/" '{print $NF}'|sort|uniq
count.gif
KSC-logosmall.gif
livevideo.gif
NASA-logosmall.gif

## 11. Find number of logical CPUs

$nproc
$lscpu #(=socket*core*threads)
$cat /proc/cpuinfo|grep "model name"|wc -l

## 12. Use of aliasing

##Need to check frequesting if files are movied or not on physical server in perticular location. Set aliases rather han hitting commands again and again

$alias war="ls -lrt /prodtx/gi5/gi/release/war|tail -6"
$alias db="ls -lrt /prodtx/gi5/gi/release/dbdata|tail -10"
$alias bin="ls -lrt /prodtx/gi5/gi/release/bin|tail -10"
$alias lib="ls -lrt /prodtx/gi5/gi/release/lib|tail -10"
$alias  ## To list out aliases set
$unalias war ## to remove entries from current users alias list 

## 13. Mail uility in Unix
$ echo "Mail body"|mailx -s "subject line" -a attachment.txt email@adress.com

## there are others utilities as well like sendmail, mail etc

## 14. Information about system
$uname -a ##all information
$uname -n ##hostname
$uname -v ##version of operating system
$uname -o ##operating system
$uname -s ##kernel

## 15 Uptime command
$uptime ##to check number of days server is up. In o/p--> current time, no of days server is up, no of users logged in, load avg for last 1, 5 and 15 minutes.

##Same o/p as uptime  we can get as a part   from following commands with additional information
$top  ##this is for monitoring
$w  ##currently logged in people


## 16 SFTP command (secure file transfer protocol)

$hostname
$ctoctxswap3p
$sftp sc59605@ctoctxmwap3p
sftp>cd /tmp/check
sftp>put abc.txt
sftp>get xyz.txt
sftp>chmod 777 abc.txt
sftp>mkdir trial_dir

## SFTP command is used to copy file sfrom one server to other server. Difference between SCP and SFTP command is- we can only copy files with the help of SCP. With SFTP, we can copy files, and perform other operations like changing permission

## 17 Find IP adress of system (on both RHEL 6 and RHEL 7)
$hostname -I
$cat /etc/hosts

## 18 To check if server is up or not
read server
ping -c 2 $server &> out_put.txt  ## -c option will limit number of request sent.
if [ $? -eq 0 ];then
echo "Server $server is reachable"
else
echo "Server $server is down"
fi