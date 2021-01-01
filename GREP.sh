### grep -A,-B, -C

###Displaying lines [A]after, [B]efore, [C] around the match

1st line before 
2nd line before
3rd line before
Hi Sushant
1st line after
2nd line after
3rdline after

grep -A 2 -i 'sushant' abc.txt
Hi Sushant
1st line after
2nd line after

grep -B 2 -i 'sushant' abc.txt
2nd line before
3rd line before
Hi Sushant

grep -C 2 -i 'sushant' abc.txt
2nd line before
3rd line before
Hi Sushant
1st line after
2nd line after

###List out file names containing patter
grep -l sushant *.txt 
abc.txt
test.txt

###abc.txt###
This is sushant. sushant is learner.
sushant is big damn learner.

###Print number of count of lines containign patter. Note: If line contains multiple times same pattern, it considers singlt count ofr whole line.
grep -c sushant abc.txt
2

###To print all occurances
grep -o sushant abc.txt|wc -l
3

### Blank line and its count
grep ^$ abc.txt
grep ^$ abc.txt|wc -l


grep ^l abc.txt  ### Lines starting with 'l'
grep unix$ abc.txt ###Lines endinf with 'unix'

grep -n unix test.txt  ###printsline with line number at start

grep -i unix test.txt ###case insensitive match


grep -v test abc.txt  ### pronts line form abc.txt that do not coantain word test

grep -w test abc.txt  ### match exact word
