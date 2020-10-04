uniq test.txt output.txt ###test.txt is i/p file, output.txt is o/p file. I/p file must be sorted format
uniq -c test.txt ###Shows each line with number of occurances
	3 I love unix
	2 Hi there
	1 Hi All
uniq -u test.txt ###Shows only uniq lines
uniq -d test.txt ###Shows only duplicate lines


####SORTING####

sort -h abc.txt  ### Human readable form. Takes care of unit like kb,MB,GB
	a
	aa
	A
	b
	12
	45
	123
	1k
	34M
	1G
### preferences: lower case->upper case->numbers->units

sort -n abc.txt ### numberick sort
sort -M sort.txt ### Month sort
sort -u abc.txt ###sorts and removes duplicate