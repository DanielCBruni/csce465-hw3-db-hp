#!/bin/bash
BIN=./legacy_log_parser_fixed
MAX=128
EXPLOIT=payload.bin
mkdir -p markers

run() {  # run <label> <file>
    echo "=== $1 ==="
    $BIN "$2"
    echo "exit code: $?"
    echo
}

printf 'short log line\n' > t_short.log
head -c $MAX  /dev/zero | tr '\0' 'A' > t_max.log
head -c $((MAX+1)) /dev/zero | tr '\0' 'A' > t_over.log

# Regenerate the original exploit payload from Task 1
python3 make_payload.py

run "Test 1: valid short input (expect success)"      t_short.log
run "Test 2: exactly $MAX bytes (expect success)"     t_max.log
run "Test 3: $((MAX+1)) bytes (expect rejection)"     t_over.log
run "Test 4: missing file (expect fopen error)"       no_such_file.log

echo "Payload size: $(stat -c %s "$EXPLOIT") bytes (limit: $MAX)"
rm -f markers/ret2win.txt
run "Test 5: original exploit payload (expect rejection)" "$EXPLOIT"
if [ -e markers/ret2win.txt ]; then
    echo "FAIL: win() was reached (marker created)"
else
    echo "PASS: markers/ret2win.txt was NOT created"
fi
