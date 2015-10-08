#!/bin/sh

APPLIANCES="tests/appliances/hatoucan.md"

if [ X`which petcat` = X ]; then
  echo 'petcat unavailable, skipping petcat tests.'
else
  APPLIANCES="$APPLIANCES tests/appliances/petcat.md"
fi

falderal $APPLIANCES tests/Commodore-BASIC-2.0.md || exit $?

if [ X`which petcat` = X ]; then
  exit 0
fi

SOURCE="../bubble-escape/src/bubble escape.bas"
if [ -e "$SOURCE" ]; then
  ./confirm-tokenization.sh 0801 "$SOURCE" || exit $?
  echo $SOURCE tokenized identically to petcat.
else
  echo $SOURCE not found, skipping test.
fi

SOURCE="../situ-sol/src/binloader.bas"
if [ -e "$SOURCE" ]; then
  ./confirm-tokenization.sh 0801 "$SOURCE" || exit $?
  echo $SOURCE tokenized identically to petcat.
else
  echo $SOURCE not found, skipping test.
fi

SOURCE="../situ-sol/src/frontpanel.bas"
if [ -e "$SOURCE" ]; then
  ./confirm-tokenization.sh 0801 "$SOURCE" || exit $?
  echo $SOURCE tokenized identically to petcat.
else
  echo $SOURCE not found, skipping test.
fi

SOURCE="../disksumo/src/disksumo.bas"
if [ -e "$SOURCE" ]; then
  ./confirm-tokenization.sh 0801 "$SOURCE" || exit $?
  echo $SOURCE tokenized identically to petcat.
else
  echo $SOURCE not found, skipping test.
fi

SOURCE="../dungeons-of-ekileugor/src/ekileugor.bas"
if [ -e "$SOURCE" ]; then
  yucca -R -x "$SOURCE" > yucca.bas.txt || exit $?
  ./confirm-tokenization.sh 1001 yucca.bas.txt || exit $?
  echo $SOURCE tokenized identically to petcat.
  rm -f yucca.bas.txt
fi

exit 0
