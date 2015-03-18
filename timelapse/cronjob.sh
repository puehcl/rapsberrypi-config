#!/bin/bash

(crontab -l ; echo "$CRONJOB_LINE") | sort - | uniq - | crontab -
