#!/bin/bash

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/doc")


echo "         Disk and Permission Auditor"

echo ""
echo "  Auditing key system directories..."
echo ""
printf "  %-20s %-12s %-10s %-10s %s\n" "Directory" "Size" "Owner" "Group" "Permissions"


# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Directory exists — gather its details

        # awk extracts: permissions($1), owner($3), group($4) from ls -ld output
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # du -sh gets human-readable disk usage; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "  %-20s %-12s %-10s %-10s %s\n" "$DIR" "$SIZE" "$OWNER" "$GROUP" "$PERMS"
    else
        # Directory does not exist on this system
        echo "  [MISSING] $DIR does not exist on this system."
    fi
done

echo ""

echo "  Git Configuration Directory Check"

echo ""

# --- Check if Git's global config directory exists ---
# Git stores its system-wide config in /etc/gitconfig
# and user-level config in ~/.gitconfig

GIT_SYSTEM_CONFIG="/etc/gitconfig"
GIT_USER_CONFIG="$HOME/.gitconfig"
GIT_GLOBAL_DIR="$HOME/.config/git"

# Check system-level git config file
if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_SYSTEM_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND]   System Git config : $GIT_SYSTEM_CONFIG"
    echo "            Permissions       : $PERMS"
else
    echo "  [INFO]    System Git config ($GIT_SYSTEM_CONFIG) not found."
fi

echo ""

# Check user-level git config file
if [ -f "$GIT_USER_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    echo "  [FOUND]   User Git config   : $GIT_USER_CONFIG"
    echo "            Permissions       : $PERMS"
else
    echo "  [INFO]    User Git config (~/.gitconfig) not found."
    echo "            This is created when you run: git config --global user.name"
fi

echo ""
echo "  Note: Git does not run as a background service or daemon."
echo "  It runs as the current user — no special system user needed."
echo "  This is a security advantage: Git has minimal system footprint."
echo ""
echo "========================================================"
