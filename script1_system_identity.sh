#!/bin/bash
# Script 1: System Identity Report
# Author: shreyansh Singh | Registration: 24BSA10072
# Course: Open Source Software | OSS Capstone Project
# Purpose: Displays a welcome screen with system information
#          and confirms the open-source license of the OS.

# --- Variables ---
STUDENT_NAME="Shreyansh Singh"            # full name
REG_NUMBER="24BSA10072"              # Registration number
SOFTWARE_CHOICE="Git"                # Chosen open-source software

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                   # Get Linux kernel version
USER_NAME=$(whoami)                  # Get current logged-in username
HOME_DIR=$HOME                       # Get home directory of current user
UPTIME=$(uptime -p)                  # Get human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y')     # Get current date in readable format
CURRENT_TIME=$(date '+%H:%M:%S')     # Get current time

# --- Get Linux distribution name (works across most distros) ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep ^PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- OS License message ---
# Linux is distributed under GPL v2 (GNU General Public License version 2)
OS_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Display the system identity report ---
echo "========================================================"
echo "        Open Source Audit — System Identity Report"
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Reg. No.  : $REG_NUMBER"
echo "  Software  : $SOFTWARE_CHOICE (GPL v2 Licensed)"
echo ""
echo "--------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "--------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "--------------------------------------------------------"
echo "  This Linux OS is covered under:"
echo "  $OS_LICENSE"
echo ""
echo "  The GPL v2 ensures that all users have the freedom to"
echo "  run, study, share, and modify the software. Any"
echo "  modifications must also be shared under GPL v2."
echo ""
echo "========================================================"
echo "  'Given enough eyeballs, all bugs are shallow.'"
echo "                          — Eric S. Raymond"
echo "========================================================"
