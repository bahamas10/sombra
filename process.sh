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
cat skull.txt |  tr -d SOMBR@
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
