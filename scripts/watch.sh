#!/bin/bash

#A cute script that will show you changes to the log file
#in real time. 

#If you're bored in lab, you can run this and watch for anomalies,
#idiots, bad students, cheeky students trying to force submissions through, etc. 

#Not perfect, some output will be duplicated, but it's close. 
#You'd have to do some special stuff and/or figure out how long a 
#full submit takes to get it perfect. 

#...or do a notification to yourself somehow. That'd be neat. 

tail /home/submissions/cs_log.log -n 12

CT=1
TIME=$(stat -c %Y /home/submissions/cs_log.log)
TIME2=$(stat -c %Y /home/submissions/cs_log.log)

while [[ "$CT" == 1 ]]; do
	TIME2=$(stat -c %Y /home/submissions/cs_log.log)
	if [[ "$TIME" -ne "$TIME2" ]]
	then
		sleep 10
		tail /home/submissions/cs_log.log -n 12
		TIME=$TIME2
	fi
done
