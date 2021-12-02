#!bin/bash
export LC_ALL=C
/etc/init.d/tias_defend restart
/etc/init.d/tias_main restart
/etc/init.d/tias_synd restart
/etc/init.d/tias_sync restart
/etc/init.d/tklogd restart
/etc/init.d/tkmonitord restart
/etc/init.d/tkserverd restart


/etc/init.d/tias_defend stop
/etc/init.d/tias_main stop
/etc/init.d/tias_synd stop
/etc/init.d/tias_sync stop
/etc/init.d/tklogd stop
/etc/init.d/tkmonitord stop
/etc/init.d/tkserverd stop
exit 0