#!/bin/bash
# takes ING bank's CSV export of the account transactions and calculates the balance next to each transaction

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 [current balance]"
	exit 1
fi

# formats cents to string
function formatCent() {
	IN=$1
	WH=$((IN/100))
	FR=$((IN<0 ? -IN % 100 :IN % 100))
	printf '%d.%02d' $WH $FR
}

# reformat to cents; e.g. 0,44 -> 44; 123,44 -> 12344
function inputCent() {
	echo $1 | sed 's/^\s*0*\([0-9]*\)[,.]\([0-9]*\)/\1\2/g'
}

if ! echo $1 | grep -x -q '[0-9][0-9]*[.,][0-9][0-9]'; then
	echo "Malformed input: $1"
	echo "Should be in format 123.45"
	exit 1
fi 

CENTS="$(inputCent $1)"

# skip header
tail -n +2 | \
# remove beginning and ending " from csv
sed 's/^"\(.*\)"\s*$/\1/' | \
# replace field separator "," in csv by |
gawk -F'","' '{for(i=1;i<=NF;i++) printf("%s|", $i); print "";}' | \
while IFS=$'|' read DATUM NAAM REKENING TEGENREKENING CODE AF BEDRAG MUTATIESOORT MEDEDELINGEN; do
	CENT=$(inputCent $BEDRAG)
	
	if [[ $AF == 'Af' ]]; then 
		CENT=-$CENT
	elif [[ $CENT -gt 25000 ]]; then
		tput bold
		tput setaf 1
	fi
	
	CENTS=$((CENTS - CENT))
	printf '%-12s %-40s %10s %10s\n' "$DATUM" "${NAAM:0:40}" "$(formatCent $CENT)" "$(formatCent $CENTS)"
	
	# reset formatting
	tput sgr0
done
