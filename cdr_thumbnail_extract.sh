#!/usr/bin/env bash

# Stop on errors
set -o errexit
set -o pipefail
set -o nounset

# Set magic variables
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename "${__file}" .sh)"

for f in *.cdr; do
	basename=`basename $f .cdr`
	echo Extrahiere Thumbnail aus $basename.cdr...
	set +e
	unzip $basename.cdr previews/thumbnail.png &> /dev/null
	set -e
	if [ -f previews/thumbnail.png ]; then
		mv previews/thumbnail.png $basename.png &> /dev/null
		echo 'Erfolgreich!'
	else
		echo 'Kein Thumbnail vorhanden!'
	fi
	echo ' '
done

if [ -f previews ]; then
	rmdir previews
fi
