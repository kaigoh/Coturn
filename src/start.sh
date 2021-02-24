#!/bin/bash

# This file ist part of the Coturn project, see https://github.com/bloodhunterd/Coturn.
# © 2021 BloodhunterD <bloodhunterd@bloodhunterd.com>

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
# Coturn
# ===================================================

turnserver
