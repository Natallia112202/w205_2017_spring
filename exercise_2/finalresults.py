import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
if len(sys.argv) != 2:
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

	cur = conn.cursor()
	cur.execute("SELECT word, count from tweetwordcount")
	records = cur.fetchall()
	for rec in records:
		print "word=",rec[0]
		print "count=",rec[1]
	sys.exit(1)

word = sys.argv[1]
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetwordcount")
	

records = cur.fetchall()
for rec in records:
	if rec[0] == str(word):
		print "Total number of occurrences of", rec[0],":",rec[1]
		sys.exit(1)
	else:
		continue
print "No such word"
        	
conn.commit()

conn.close()


