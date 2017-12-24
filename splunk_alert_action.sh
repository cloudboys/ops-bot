#!/bin/sh

# Create a Temp File and extract splunk Result into temp file. format of the temp file outputted by splunk is csv. Output argument number is $8
UUID=$(cat /proc/sys/kernel/random/uuid);echo $UUID;gunzip -c $8 > /tmp/$UUID.csv;

# Now Clone the git every single time perform necessary task. - Logic is left in git to acheive scalability
cd /tmp/
echo "Cloning latest code from git"
env GIT_SSL_NO_VERIFY=true git clone -b master http://5d6571f550cfa75350de2424ea4110bad349ce3b:x-oauth-basic@github.com/cloudboys/nosql-bot.git
chmod +x /tmp/nosql-bot/splunk_alert_action.py

# Covnvert the csv to json and push the message to SQS
python /tmp/nosql-bot/splunk_alert_action.py "$UUID"

# Remove all temp file created by this splunk alert action
#rm /tmp/$UUID.csv
#rm -rf /tmp/nosql-bot
#rm /tmp/$UUID.json
