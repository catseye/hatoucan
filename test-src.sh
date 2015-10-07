#!/bin/sh

petcat -w2 -- "$1" 2>/dev/null | hexdump -C > petcat.txt
script/hatoucan < "$1" | hexdump -C > hatoucan.txt
diff -q petcat.txt hatoucan.txt && \
  echo "Successfully tokenized identically to petcat!" && \
  rm petcat.txt hatoucan.txt && \
  exit 0
diff -ru petcat.txt hatoucan.txt | cdiff
