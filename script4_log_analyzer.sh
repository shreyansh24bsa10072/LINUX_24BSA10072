#!/bin/bash

#  Command-line arguments 
LOGFILE=$1               # First argument: path to log file
KEYWORD=${2:-"error"}    # Second argument: keyword to search (default: "error")

# --- Counter variable to track keyword matches ---
COUNT=0

echo "         Log File Analyzer"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [ERROR] No log file specified."
    echo "  Usage: ./script4_log_analyzer.sh <logfile> [keyword]"
    echo "  Example: ./script4_log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# --- Check if the specified log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [ERROR] File not found: $LOGFILE"
    echo ""
    echo "  Common Linux log file locations:"
    echo "    /var/log/syslog      (Debian/Ubuntu systems)"
    echo "    /var/log/messages    (Red Hat/Fedora/CentOS systems)"
    echo "    /var/log/auth.log    (Authentication logs)"
    echo "    /var/log/kern.log    (Kernel messages)"
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [WARNING] The file $LOGFILE is empty."
    echo "  Retrying with a broader system log location..."
    echo ""

    # Do-while style retry: try alternative log files if primary is empty
    RETRY_COUNT=0
    MAX_RETRIES=3
    ALT_LOGS=("/var/log/syslog" "/var/log/messages" "/var/log/kern.log")

    for ALT_LOG in "${ALT_LOGS[@]}"; do
        RETRY_COUNT=$((RETRY_COUNT + 1))
        if [ -s "$ALT_LOG" ]; then
            echo "  [RETRY $RETRY_COUNT] Found non-empty log: $ALT_LOG"
            LOGFILE="$ALT_LOG"
            break
        fi
        if [ "$RETRY_COUNT" -ge "$MAX_RETRIES" ]; then
            echo "  [FAILED] Could not find a non-empty log file after $MAX_RETRIES retries."
            exit 1
        fi
    done
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive)"
echo ""
echo "  Scanning file line by line..."
echo ""

# --- While-read loop: read file one line at a time ---
# IFS= prevents trimming of whitespace; -r prevents backslash interpretation
while IFS= read -r LINE; do

    # If statement inside the loop: check if this line contains the keyword
    # grep -iq makes the search case-insensitive and quiet (no output)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment counter for each matching line
    fi

done < "$LOGFILE"    # Redirect file content into the while loop

# --- Summary output ---

echo "  RESULTS"
echo ""
echo "  Keyword '$KEYWORD' found : $COUNT times"
echo "  Total lines scanned      : $(wc -l < "$LOGFILE")"
echo ""

# --- Print last 5 matching lines using grep and tail ---
if [ "$COUNT" -gt 0 ]; then
    echo "  Last 5 lines containing '$KEYWORD':"
    echo "  ......................................................."
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH_LINE; do
        echo "  > $MATCH_LINE"
    done
else
    echo "  No lines containing '$KEYWORD' were found in the log."
fi

echo ""
echo "  Open Source Note: Linux's transparent logging system"
echo "  is itself a FOSS principle — nothing hidden, everything"
echo "  auditable by any user or administrator."
