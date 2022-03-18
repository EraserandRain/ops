#!/bin/bash
export LC_ALL=C
current_date=$(date -d '-1 day' '+%Y%m%d')
cd /data
mkdir -p "visitlog_${current_date}"
find /visitlog/ -mtime +1 -regex '.*log$' -exec mv {} "/data/visitlog_${current_date}" \;
echo "success"
exit 0