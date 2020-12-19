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

sed -i.bkp 's/sushant/chavare/g' abc.txt --> ## creates a backup file abc.txt.bkp and content of this file will be same as old file. abc.txt will have new pattern.

sed 's/.$/5/g' sed.txt  ----> Last letter is replaced by 5
sed 's/^.//' sed.txt  ----> removes first letter for each line (to remove commented lines  sed 's/^#//' abc.txt


#######################

# Append (a), Insert (i), replace (c)

# Append (a) --- appends given line after specified line number or pattern or word matching line

cat abc.txt
This is line number 1
This is line number 2
This is line number 3
This is line number 4
This is line number 5
This is line number 6
This is line number 7

sed '3 a Line appended' abc.txt
This is line number 1
This is line number 2
This is line number 3
Line appended
This is line number 4
This is line number 5
This is line number 6
This is line number 7

sed '3 a "Line appended"' abc.txt
This is line number 1
This is line number 2
This is line number 3
"Line appended"
This is line number 4
This is line number 5
This is line number 6
This is line number 7

sed '/six/ a "Line appended after 6th line"' abc.txt
This is line number 1- first
This is line number 2- second
This is line number 3- third
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
"Line appended after 6th line"
This is line number 7- seven


# Insert (i) --- add line before given line number or pattern

sed '1 i "Line at very start"' abc.txt
"Line at very start"
This is line number 1- first
This is line number 2- second
This is line number 3- third
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
This is line number 7- seven

sed '4 i "line before 4th"' abc.txt
This is line number 1- first
This is line number 2- second
This is line number 3- third
"line before 4th"
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
This is line number 7- seven


sed '/Fourth/I i "line before 4th"' abc.txt  # I for case insensitive
This is line number 1- first
This is line number 2- second
This is line number 3- third
"line before 4th"
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
This is line number 7- seven	

# Replace/change (c) --- replaces given line, patern matching line with given line

sed '3 c "Replacing third line with this"' abc.txt
This is line number 1- first
This is line number 2- second
"Replacing third line with this"
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
This is line number 7- seven

sed '/third/ c "Replacing pattern matching third"' abc.txt
This is line number 1- first
This is line number 2- second
"Replacing pattern matching third"
This is line number 4- fourth
This is line number 5- fifth
This is line number 6- six
This is line number 7- seven