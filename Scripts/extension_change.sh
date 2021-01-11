[sunita_chavare2020@unix-box-1 TEST]$ touch abc{1..5}.txt
[sunita_chavare2020@unix-box-1 TEST]$ ls -lrt
total 0
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc5.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc4.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc3.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc2.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc1.txt
[sunita_chavare2020@unix-box-1 TEST]$ 
[sunita_chavare2020@unix-box-1 TEST]$ 
[sunita_chavare2020@unix-box-1 TEST]$ for i in *.txt
> do
> mv $i ${i%txt}sh
> done
[sunita_chavare2020@unix-box-1 TEST]$ ls -lrt
total 0
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc5.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc4.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc3.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc2.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc1.sh

---------------------------------------------------------------------------------


[sunita_chavare2020@unix-box-1 TEST]$ touch abc{1..5}.txt
[sunita_chavare2020@unix-box-1 TEST]$ ls -lrt
total 0
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc5.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc4.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc3.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc2.txt
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc1.txt
[sunita_chavare2020@unix-box-1 TEST]$
[sunita_chavare2020@unix-box-1 TEST]$ find . -type f -name "*.txt" -exec mv {} {}.sh \;
[sunita_chavare2020@unix-box-1 TEST]$
[sunita_chavare2020@unix-box-1 TEST]$ ls -lrt
total 0
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc5.txt.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc4.txt.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc3.txt.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc2.txt.sh
-rw-rw-r--. 1 sunita_chavare2020 sunita_chavare2020 0 Jan 11 10:35 abc1.txt.sh
