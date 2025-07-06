#!/bin/bash

bt_status=$(rfkill list bluetooth | grep "Soft blocked" | awk '{print $3}')
if [[ $bt_status == "no" ]]; then
    rfkill block bluetooth
else
    rfkill unblock bluetooth
fi
