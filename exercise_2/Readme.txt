# instructions on how to run wordcount Twitter application:

1. Request public DNS of EC2 and pem key file:
2. connect to EC2 and mount the storage device type the following in your terminal window:
		mount -t ext4 <device name> /data
3. Navigate to w205 :
	su - w205
and then to extweetwordcount directory: 
	cd ~/w205_2017_spring/exercise_2/extweetwordcount
4. when in the directory type:
	sparce run
the command initiate the Twitter reading and the words/word counts will appear on the scressn. The wordcount will run until stopped by hitting "control + C".

EXAMPE1:
13944 [Thread-19] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5239, name:count-bolt for: 14
13946 [Thread-31] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5264, name:count-bolt forcibly: 1
13949 [Thread-31] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5264, name:count-bolt drag: 1
13949 [Thread-19] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5239, name:count-bolt airlines: 1
13952 [Thread-31] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5264, name:count-bolt onto: 1
13954 [Thread-31] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5264, name:count-bolt its: 1
13955 [Thread-19] INFO  backtype.storm.task.ShellBolt - ShellLog pid:5239, name:count-bolt to: 38


5. Access the results through the Postgres,to retrieve postgres table type the following:
	psql -U postgres
	\c tcount
examine the tcount database:
	\dt
to access the tweetwordcount table and see the reading, run the following query:
	select * from tweetwordcount;

EXAMPLE 2
tcount=# select * from tweetwordcount;
     word     | count 
--------------+-------
 happy        |     1
 birthday     |     1
 kwest        |     1
 you've       |     1
 hope         |     1
 had          |     1
 hmm          |     1

etc. . .

hit "ENTER" if want to see more words/counts. Hit "control + C" to exit the table.

if would like to limit number of rows (example):
	select * from tweetwordcount limit 10;

if you would like to transfer results into .csv file:
	in postgres execute the following query:
		\copy <file_name> to '/home/w205/<subdirectory where you save the file on EC2>/file_name.csv' delimiter ',' csv header
EXAMPLE 3	\copy my_file to '/home/w205/w205_2017_spring/exercise_2/my_file.csv' delimiter ',' csv header


if you would like to clear the table and start new twitter sparse run:
	delete from tweetwordcount;
to exit postgres:
	\q

6. Access the results through finalresults.py file (could be found in extweetwordcount directory):
	-if wish to see all the resutls on words-word count:
		python finalresults.py 
	-if would like to check if the a particular word appear in Tweet stream you just 		executed, type this:
		python finalresults.py <your word>
7. To access what words appear withing the range of the counts, e.g. what words were mentioned  more or equal than k1 times but less or equal than k2 times, use histogram.py file:
	python histogram.py 3,8
EXAMPLE 4
i : 3
a : 4
the : 3
Like : 3

8. to logout from w205 to root: hit "control + D"

