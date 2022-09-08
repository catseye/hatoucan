#!/usr/bin/env python3

# converts raw bytes on input to hex couples on input.

import sys

while True:
    byte = sys.stdin.buffer.read(1)
    if len(byte) < 1:
        sys.exit(0)
    sys.stdout.write('%02x' % ord(byte))
