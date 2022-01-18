#!bin/bash
export LC_ALL=C
/etc/init.d/tias_defend stop
/etc/init.d/tias_logd stop
/etc/init.d/tias_main stop
/etc/init.d/tias_monitor stop
/etc/init.d/tias_synd stop

/etc/init.d/tias_defend restart
/etc/init.d/tias_logd restart
/etc/init.d/tias_main restart
/etc/init.d/tias_monitor restart
/etc/init.d/tias_synd restart