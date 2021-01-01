##### Word frequency in text #####
[sunita_chavare2020@unix-box-1 ~]$ cat xyz.txt
Hi
New line added
ANother line

#### Get number of times each word occures in txt file

[sunita_chavare2020@unix-box-1 ~]$ cat xyz.txt|tr -s ' ' '\n'|sort|uniq -c
      1 added
      1 ANother
      1 Hi
      2 line
      1 New
	  

[sunita_chavare2020@unix-box-1 ~]$ cat xyz.txt|tr -s ' ' '\n'|sort|uniq -c|sort -rn  #### In reverse order of number of times each word occures
      2 line
      1 New
      1 Hi
      1 ANother
      1 added
	  


[sunita_chavare2020@unix-box-1 ~]$ cat xyz.txt|tr -s ' ' '\n'|awk '{count[$1]++} END{for (i in count) print count[i], i}'    #### Using AWK
2 line
1 added
 1 ANother
1 New


[sunita_chavare2020@unix-box-1 ~]$ cat xyz.txt|tr -s ' ' '\n'|awk '{count[$1]++} END{for (i in count) print i,"-->",count[i]}'
line --> 2
added --> 1
Hi --> 1
ANother --> 1
New --> 1  