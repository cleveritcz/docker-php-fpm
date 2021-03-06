#!/bin/bash

### update PHP session handler
if [ ! -z ${SUPERVISORD_PATH+x} ] && [ "$SUPERVISORD_PATH" != "" ]; then 
	echo "env SUPERVISORD: including configurations from [ $SUPERVISORD_PATH ]"

	sed -i "/files = /d"                /etc/supervisor/supervisord.conf
	echo "files = $SUPERVISORD_PATH" >> /etc/supervisor/supervisord.conf

	/etc/init.d/supervisor start
fi
