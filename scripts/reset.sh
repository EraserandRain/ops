#!bin/bash
export LC_ALL=C
/etc/init.d/tias_defend restart
/etc/init.d/tias_main restart
/etc/init.d/tias_synd restart
/etc/init.d/tklogd restart
/etc/init.d/tkmonitord restart
/etc/init.d/tkserverd restart
exit 0