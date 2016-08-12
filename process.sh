#!/usr/bin/env bash
# run some processing on the skull
# MIT License 2016

hr() {
	echo
	echo '------------------------'
	echo
}

echo skull without white space
cat skull.txt | tr -d ' '
hr

echo skull without whitespace and newlines
cat skull.txt | tr -d ' ' | tr -d '\n'; echo
hr

echo skull with SOMBR@ replaced with spaces
cat skull.txt | tr SOMBR@ '     '
hr

echo skull with SOMBR@ removed
cat skull.txt | tr -d SOMBR@
hr

echo skull without white spaces or SOMBR@
cat skull.txt | tr -d ' ' | tr -d SOMBR@
hr

echo skull without whitespace, newlines, or SOMBR@
cat skull.txt | tr -d ' ' | tr -d '\n' | tr -d SOMBR@; echo
hr

echo skull without whitespace, newlines, SOMBR@, or non-alphanumeric characters
cat skull.txt | tr -d ' ' | tr -d '\n' | tr -d SOMBR@ | tr -cd '[[:alpha:]]'; echo
hr

echo skull without SOMBR@ removed
cat skull.txt | sed -e 's/[^SOMBR@]/ /g'
hr

echo frequency count of unique letters
echo '(<frequenc> <character>)'
cat skull.txt | fold -w1 | sort | uniq -c | sort -n
hr

echo skull with OMB@ replaced with spaces
cat skull.txt | tr OMB@ '   '
hr

