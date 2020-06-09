#!/usr/bin/env bash

# Stop on errors
set -o errexit
set -o pipefail
set -o nounset

# Set magic variables
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

for f in *.cdr; do
	dateiname=`basename $f .cdr`
	echo $dateiname.pdf
done
