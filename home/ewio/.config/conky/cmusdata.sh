#!/bin/bash

QUERY=$(cmus-remote -Q)
STATUS=$(echo "$QUERY" | sed -n '1{s/status \(.\)/\u\1/p}')

if [ "$STATUS" = "Stopped" ] || [ "$STATUS" = "" ]
then
	echo "$STATUS"
else
	echo "$STATUS:"
	echo "$QUERY" | sed '5,7!d;s/^tag [^ ]* /${alignr}/;' | sed '1{N;h;d};3G' | sed '1s/^/${font DM Mono:style=Extended:size=18}/;s/$/${font}/'
fi
