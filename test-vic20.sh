#!/bin/sh

# actually calls yucca too, to test dungeons-of-ekileugor

yucca -R -x $1 > yucca.bas.txt || exit $?
petcat -l 1001 -w2 -- yucca.bas.txt 2>/dev/null | hexdump -C > petcat.txt
script/hatoucan -l 1001 < yucca.bas.txt | hexdump -C > hatoucan.txt
diff -q petcat.txt hatoucan.txt && \
  echo "Successfully tokenized identically to petcat -l 1001!" && \
  rm yucca.bas.txt petcat.txt hatoucan.txt && \
  exit 0
diff -ru petcat.txt hatoucan.txt | cdiff
