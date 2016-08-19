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

echo skull with SOMBr@ replaced with spaces
cat skull.txt | tr SOMBr@ '     '
hr

echo skull with SOMBr@ removed
cat skull.txt | tr -d SOMBr@
hr

echo skull without white spaces or SOMBr@
cat skull.txt | tr -d ' ' | tr -d SOMBr@
hr

echo skull without whitespace, newlines, or SOMBr@
cat skull.txt | tr -d ' ' | tr -d '\n' | tr -d SOMBr@; echo
hr

echo skull without whitespace, newlines, SOMBr@, or non-alphanumeric characters
cat skull.txt | tr -d ' ' | tr -d '\n' | tr -d SOMBr@ | tr -cd '[[:alpha:]]'; echo
hr

echo skull without SOMBr@ removed
cat skull.txt | sed -e 's/[^SOMBr@]/ /g'
hr

echo frequency count of unique letters
echo '(<frequenc> <character>)'
cat skull.txt | fold -w1 | sort | uniq -c | sort -n
hr

echo skull with OMB@ replaced with spaces
cat skull.txt | tr OMB@ '   '
hr

