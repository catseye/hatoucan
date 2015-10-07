#!/bin/sh

petcat -w2 -- "$1" | hexdump -C > petcat.txt
script/hatoucan < "$1" | hexdump -C > hatoucan.txt
diff -ru petcat.txt hatoucan.txt | cdiff
rm -f petcat.txt hatoutcan.txt
