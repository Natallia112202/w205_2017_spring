import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


k1 = int(sys.argv[1][0])
k2 = int(sys.argv[1][2])
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetwordcount")


records = cur.fetchall()
found = False
for rec in records:
        if rec[1] >= k1 and rec[1] <= k2:
		found = True
                print rec[0],":",rec[1]

if not found:
	print "no words with count between %s and %s" % (k1, k2)
conn.close()
sys.exit(1)
