#!/bin/sh

# Usage: confirm-tokenization.sh <load-addr> <basic-source>

# output can be piped through cdiff

LOAD_ADDR="$1"
SOURCE="$2"

petcat -w2 -l $LOAD_ADDR -- "$SOURCE" 2>/dev/null | hexdump -C > petcat.txt
script/hatoucan -l $LOAD_ADDR < "$SOURCE" | hexdump -C > hatoucan.txt
diff -q petcat.txt hatoucan.txt && \
  rm petcat.txt hatoucan.txt && \
  exit 0
diff -ru petcat.txt hatoucan.txt
rm petcat.txt hatoucan.txt
exit 1
