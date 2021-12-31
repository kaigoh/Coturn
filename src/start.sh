#!/bin/bash

# This file ist part of the Coturn project, see https://github.com/bloodhunterd/Coturn.
# © 2021 BloodhunterD <bloodhunterd@bloodhunterd.com>

# ===================================================
#
# Mods by kaigoh <kai@gohegan.uk>
# 
# ===================================================

# ===================================================
# kaigoh: Get external IP from ifconfig.io
# ===================================================
if [ -z "${EXTERNAL_IP+x}" ]; then
	EXTERNAL_IP=$(curl -4 "ifconfig.io/ip")
	echo "Found external IP: ${EXTERNAL_IP}"
	export EXTERNAL_IP
fi

# ===================================================
# Configuration
# ===================================================

r=()
r+=("$(find /etc -type f -name 'turnserver.conf')")
for d in "${r[@]}"
do
	for f in $d
	do
		# Replace only if not mounted as read-only
		if [ -w "$f" ]
		then
			t="$f.tmp"
			mv $f $t
			envsubst < $t > $f
			rm $t
		fi
	done
done

# ===================================================
# kaigoh: Change ownership of SSL certs
# ===================================================
chown -R turnserver:turnserver /etc/ssl/private/
chmod -R 644 /etc/ssl/private/*.pem
chmod -R 600 /etc/ssl/private/key.pem

# ===================================================
# Coturn
# ===================================================

turnserver
