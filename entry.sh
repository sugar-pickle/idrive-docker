#!/bin/bash
if [ ! -d /app/idriveIt/user_profile ]; then
    echo "User profile does not exist yet, please login using /app/setup.sh"
    while [ true ];
    do
        sleep 5
    done
fi
/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf