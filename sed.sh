###SED Command

# 1. To replace a word

sed 's/sushant/chavare/' abc.txt  #replaces 1st occurenace in each line
sed 's/sushant/chavare/g' abc .txt #replaces all occurences of 'sushant' with 'chavare'
sed 's/sushant/chavare/5' abc.txt #replaces filfth occurance only
sed 's/sushant/chavare/3g' abc.txt #from 3rd occurance to all replaces

sed 'n s/sushant/chavare/g' abc.txt #on nth line replaces all the occurances.
sed '4,7 s/sushant/chavare/g' abc.txt #from line 4 to 7, replaces all occurances
sed '5,$ s/sushant/chavare/g' abc.txt #from 5th line to last line replaces all occurances

sed -n 's/sushant/chavare/gp' abc.txt  # prints only line with occurances replaced.
sed 's/sushant/chavare/p' abc.txt #line where occured print 2 times, other lines single times

sed 's/sushant/chavare/gi' abc.txt   ### 'i' flag is for case-insesitive

# 2. to delete lines

##by line numbers
sed '5d' abc.txt  #deletes 5th line
sed '$d' abc.txt   #deletes last line
sed '4,8d' abc.txt   #deletes line from 4th to 8th
sed '5~2d' abc.txt   ##deletes line number 5,7,9,11,13,15.....line
sed '4~3d' abc.txt   ####deletes line number 4,7,10,13,16    (m~n   startes from m line and jumps by n number and delete that line.



#by matching pattern

sed '/sushant/d' abc.txt ##lines with sushant occurance will delete.
sed '/^$/d' abc.txt  ##deletes all the blank lines

###Using regex

sed '/^sushant/d' abc.txt  ##deletes line starting with sushant
sed '/chavare$/d' abc.txt ##deletes line ending with chavare

#### '&' character-- represents content of pattern that was matched.

sed 's/^[[:digit:]]/(&)/' abc.txt   #### line starting with digit, puts digit in bracket

### Command option to save changes in same file. As 'sed' will give o/p on screen, we want to save change in file itself

sed -i 's/sushant/chavare/g' abc.txt    ## Option '-i' is used



