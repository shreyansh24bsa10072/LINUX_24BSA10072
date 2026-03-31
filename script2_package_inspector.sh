#!/bin/bash

# --- Set the package to inspect ---
PACKAGE="git"    # Our chosen open-source software


echo "         FOSS Package Inspector"

echo ""
echo "  Checking package: $PACKAGE"
echo ""

# --- Check if the package is installed ---
# We try rpm first (Red Hat/Fedora/CentOS), then dpkg (Debian/Ubuntu)
if command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    # Package found via RPM package manager
    echo "  [FOUND] $PACKAGE is installed (via RPM)."
    echo ""
    echo "  --- Package Details ---"
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|Vendor'

elif command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" &>/dev/null 2>&1 | grep -q "^ii"; then
    # Package found via DPKG package manager (Debian/Ubuntu)
    echo "  [FOUND] $PACKAGE is installed (via DPKG)."
    echo ""
    echo "  --- Package Details ---"
    dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Version: " $3}'
    dpkg -s "$PACKAGE" | grep -E 'Version|License|Description' | head -5

elif command -v git &>/dev/null; then
    # Git is accessible as a command even if not via a package manager
    echo "  [FOUND] $PACKAGE is installed (detected via command)."
    echo ""
    GIT_VERSION=$(git --version)
    echo "  Version : $GIT_VERSION"
    echo "  License : GPL v2"

else
    # Package is not installed on this system
    echo "  [NOT FOUND] $PACKAGE is NOT installed on this system."
    echo "  To install on Debian/Ubuntu : sudo apt install git"
    echo "  To install on Fedora/CentOS : sudo dnf install git"
fi

echo ""

echo "  Open Source Philosophy Notes"

echo ""

# --- Case statement: print a philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git: Born out of frustration — Linus Torvalds built Git"
        echo "  in just two weeks when proprietary tools failed him."
        echo "  It embodies the open-source belief that collaboration"
        echo "  and transparency produce better software than secrecy."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  It proved that community-driven development could power"
        echo "  the backbone of the world's websites."
        ;;
    mysql | mariadb)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual licensing model is a fascinating study in how"
        echo "  businesses can profit while giving back to the community."
        ;;
    python3 | python)
        echo "  Python: A language shaped entirely by community."
        echo "  The PSF license and PEP process show how open governance"
        echo "  leads to clean, readable, universally loved software."
        ;;
    vlc)
        echo "  VLC: Built by students who just wanted to stream video."
        echo "  It shows that open source solves real, everyday problems"
        echo "  when proprietary tools fall short."
        ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web."
        echo "  Mozilla's mission proves that open source is not just"
        echo "  about code — it is about values and user rights."
        ;;
    *)
        # Default case for any unlisted package
        echo "  $PACKAGE: Every open-source tool carries a philosophy —"
        echo "  that knowledge shared freely benefits everyone more than"
        echo "  knowledge locked behind proprietary walls."
        ;;
esac

echo ""

