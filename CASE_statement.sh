[sunita_chavare2020@unix-box-1 ~]$ name="Sushant"
[sunita_chavare2020@unix-box-1 ~]$ case $name in
> "Sushant") echo "Owner of this unix m/c";;
> "Raj") echo "He's from Big Bang Theory";;
> *) echo "Default statement";;
> esac
Owner of this unix m/c



-------------

read input_str
Hello
[sunita_chavare2020@unix-box-1 ~]$ case $input_str in
> "Hello") echo "Hi Hello, Guest";;
> "Bye") echo "Bye Bye Guest, visist again";;
> *) echo "Invalid";;
> esac
Hi Hello, Guest