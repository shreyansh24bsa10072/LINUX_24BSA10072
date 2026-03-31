#!/bin/bash
print_divider() {
    echo "========================================================"
}

# --- Welcome message ---
print_divider
echo "         Open Source Manifesto Generator"
echo "         Shreyansh Singh| 24BSA10072"
print_divider
echo ""
echo "  This script will ask you three short questions and"
echo "  generate a personalised open-source manifesto for you."
echo "  Your manifesto will be saved as a .txt file."
echo ""
print_divider
echo ""

# --- Read user input interactively ---
# read -p displays a prompt and waits for the user to type a response

read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Date and output file setup ---
DATE=$(date '+%d %B %Y')                    # Human-readable date
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')         # Timestamp for unique filename
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"   # Unique output filename

# --- Compose the manifesto using string concatenation and echo with >> ---
# The >> operator appends to a file (> would overwrite)

# Write header to file
echo "       MY OPEN SOURCE MANIFESTO"                          >> "$OUTPUT"
echo "       Shreyansh Singh | 24BSA10072"                          >> "$OUTPUT"
echo "       Generated on: $DATE"                               >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"

# Write the personalised manifesto paragraph
echo "I, Shreyansh Singh, believe in the power of open source."     >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool built not by a"      >> "$OUTPUT"
echo "single company for profit, but by a community of people" >> "$OUTPUT"
echo "who chose to share their work with the world. That act"  >> "$OUTPUT"
echo "of sharing is what I understand as $FREEDOM."            >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "Open source taught me that knowledge grows when it is"   >> "$OUTPUT"
echo "shared. A locked idea serves one person. A shared idea"  >> "$OUTPUT"
echo "can serve millions. This is why I commit to building"    >> "$OUTPUT"
echo "$BUILD — and releasing it freely, so that others can"    >> "$OUTPUT"
echo "learn from it, improve it, and build something greater." >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "I stand on the shoulders of giants — the developers who" >> "$OUTPUT"
echo "wrote Linux, Git, Python, and Apache without asking for" >> "$OUTPUT"
echo "anything in return. My contribution, however small,"     >> "$OUTPUT"
echo "is my way of paying that forward."                       >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"

echo "  'Software is like sex: it's better when it's free.'"  >> "$OUTPUT"
echo "                              — Linus Torvalds"          >> "$OUTPUT"

# --- Confirm the file was saved and display it ---
echo ""
echo "  Manifesto saved to: $OUTPUT"

echo ""

# Display the manifesto content
cat "$OUTPUT"

echo ""
echo "  Your manifesto has been saved. You can share it,"
echo "  print it, or commit it to your GitHub repo."
echo ""
print_divider
