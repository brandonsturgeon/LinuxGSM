#!/bin/bash
# LinuxGSM alert_pushover.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Sends Pushover alert.

local commandname="ALERT"
local commandaction="Alert"
local function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

json=$(cat <<EOF
{
	"token": "${pushovertoken}",
	"user": "",
	"device": "all",
	"title": "Backup finished - SQL1",
	"message": "TEST"
}
EOF
)

curl -sSL -H "Content-Type: application/json" -X POST -d """${json}""" "https://api.pushover.net/1/messages.json"