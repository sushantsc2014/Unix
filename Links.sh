## LINKS ##

1. Hard Link

#a. Suppose I have file 'xyz.txt' in '/tmp/jackpot/dir2'. And I want to access file in '/tmp/jackpot/' directory. I'll create link at this location

$ ln /tmp/jackpot/dir2/xyz.txt hard_link_name    #creating hard link

[sushantsc2014@unix-box jackpot]$ ln /tmp/jackpot/dir2/xyz.txt hard_link_xyz
[sushantsc2014@unix-box jackpot]$ ls -lrt
total 16
-rw-rw-r--. 1 sushantsc2014 sushantsc2014   14 Sep 30 08:48 abc.txt
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:22 dir1
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:22 dir2
-rw-rw-r--. 2 sushantsc2014 sushantsc2014   24 Oct 23 13:23 hard_link_xyz
[sushantsc2014@unix-box jackpot]$ cat hard_link_xyz
Hi this is file in dir2

#b. Both file and hard link will have same inode numbers
[sushantsc2014@unix-box jackpot]$ ls -i /tmp/jackpot/dir2/xyz.txt 
262170 /tmp/jackpot/dir2/xyz.txt
[sushantsc2014@unix-box jackpot]$ ls -i /tmp/jackpot/hard_link_xyz
262170 /tmp/jackpot/hard_link_xyz

#c.  We can't create hard link for directories
[sushantsc2014@unix-box jackpot]$ ln /tmp/jackpot/dir1 hard_link_directory 
ln: /tmp/jackpot/dir1: hard link not allowed for directory

#d. If we delete original file, no effect on hard link file
[sushantsc2014@unix-box jackpot]$ rm /tmp/jackpot/dir2/xyz.txt
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/dir2/xyz.txt
cat: /tmp/jackpot/dir2/xyz.txt: No such file or directory
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/hard_link_xyz
Hi this is file in dir2

#e. If we make changes in original file or hard link file, changes will rflect in other file automatically.
cat /tmp/jackpot/dir2/xyz.txt
This is new link after deleting file and re-creating
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/hard_link_xyz
This is new link after deleting file and re-creating

[sushantsc2014@unix-box jackpot]$ cat>>/tmp/jackpot/hard_link_xyz
Appending line 2 in hardlink file
[sushantsc2014@unix-box jackpot]$ 
[sushantsc2014@unix-box jackpot]$ 
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/hard_link_xyz
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/dir2/xyz.txt
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
[sushantsc2014@unix-box jackpot]$ 

########################
2. SOFT links

[sushantsc2014@unix-box jackpot]$ ln -s /tmp/jackpot/dir2/xyz.txt soft_link_xyz  #creating soft link
[sushantsc2014@unix-box jackpot]$ ls -lrt
total 16
-rw-rw-r--. 1 sushantsc2014 sushantsc2014   14 Sep 30 08:48 abc.txt
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:22 dir1
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:36 dir2
-rw-rw-r--. 2 sushantsc2014 sushantsc2014   87 Oct 23 13:40 hard_link_xyz
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   25 Oct 23 13:44 soft_link_xyz -> /tmp/jackpot/dir2/xyz.txt
[sushantsc2014@unix-box jackpot]$ 

### Another way of creating soft link ###

cp -s /tmp/jackpot/file_1.txt soft_link_name   ## this will create a soft is in present direcotry. This command can only br used to create soft link in present directory. CP -s

#a. Both original file and soft link file will have different inode numbers
[sushantsc2014@unix-box jackpot]$ ls -i /tmp/jackpot/dir2/xyz.txt
262186 /tmp/jackpot/dir2/xyz.txt
[sushantsc2014@unix-box jackpot]$ ls -i /tmp/jackpot/soft_link_xyz
262170 /tmp/jackpot/soft_link_xyz

#b. We can create soft link for Directories as well.
[sushantsc2014@unix-box jackpot]$ ln -s /tmp/jackpot/dir1 soft_link_dir1
[sushantsc2014@unix-box jackpot]$ ls -lrt
total 16
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:22 dir1
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:36 dir2
-rw-rw-r--. 2 sushantsc2014 sushantsc2014   87 Oct 23 13:40 hard_link_xyz
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   25 Oct 23 13:44 soft_link_xyz -> /tmp/jackpot/dir2/xyz.txt
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   17 Oct 23 13:47 soft_link_dir1 -> /tmp/jackpot/dir1     ###SOFT link for directory created 

#c. If we make changes in original file or in soft link file, changes will reflect in other file.
[sushantsc2014@unix-box jackpot]$ cat>>/tmp/jackpot/dir2/xyz.txt 
third link for file in dire2
[sushantsc2014@unix-box jackpot]$ 
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/dir2/xyz.txt
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
third link for file in dire2
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/soft_link_xyz
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
third link for file in dire2
[sushantsc2014@unix-box jackpot]$ 


[sushantsc2014@unix-box jackpot]$ cat>>/tmp/jackpot/soft_link_xyz 
fourth link added in soft link file
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/dir2/xyz.txt
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
third link for file in dire2
fourth link added in soft link file
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/soft_link_xyz
This is new link after deleting file and re-creating
Appending line 2 in hardlink file
third link for file in dire2
fourth link added in soft link file
[sushantsc2014@unix-box jackpot]$ 


#d. If we delete original file, soft link file is of no use.
[sushantsc2014@unix-box jackpot]$ rm /tmp/jackpot/dir2/xyz.txt
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/dir2/xyz.txt
cat: /tmp/jackpot/dir2/xyz.txt: No such file or directory
[sushantsc2014@unix-box jackpot]$ 
[sushantsc2014@unix-box jackpot]$ cat /tmp/jackpot/soft_link_xyz
cat: /tmp/jackpot/soft_link_xyz: No such file or directory
[sushantsc2014@unix-box jackpot]$ ls -lrt
total 16
-rw-rw-r--. 1 sushantsc2014 sushantsc2014   14 Sep 30 08:48 abc.txt
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:22 dir1
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   25 Oct 23 13:44 soft_link_xyz -> /tmp/jackpot/dir2/xyz.txt
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   17 Oct 23 13:47 soft_link_dir1 -> /tmp/jackpot/dir1
-rw-rw-r--. 1 sushantsc2014 sushantsc2014  152 Oct 23 13:50 hard_link_xyz
drwxrwxr-x. 2 sushantsc2014 sushantsc2014 4096 Oct 23 13:52 dir2


'''
-rw-rw-r--. 2 sushantsc2014 sushantsc2014   87 Oct 23 13:40 hard_link_xyz  ### Hard link is created as simple file
lrwxrwxrwx. 1 sushantsc2014 sushantsc2014   25 Oct 23 13:44 soft_link_xyz -> /tmp/jackpot/dir2/xyz.txt  ### This is symbolic link 'l'
'''