# OSS Audit — Git
### oss-audit-24bce11519

**Student Name:** Rishav Raj  
**Registration Number:**24bce11519
**Course:** Open Source Software (OSS NGMC)  
**Chosen Software:** Git (Version Control System) — Licensed under GPL v2  

---

## About This Project

This repository is the technical submission for the Open Source Audit Capstone Project. It contains five shell scripts that demonstrate practical Linux shell scripting skills while exploring the philosophy, licensing, and ecosystem of **Git** — the world's most widely used distributed version control system, created by Linus Torvalds in 2005.

---

## Repository Contents

```
oss-audit-24bve11519/
├── script1_system_identity.sh       # System welcome screen with OS/kernel info
├── script2_package_inspector.sh     # Checks if Git is installed + philosophy notes
├── script3_disk_auditor.sh          # Audits system directories and permissions
├── script4_log_analyzer.sh          # Reads and analyzes Linux log files
├── script5_manifesto_generator.sh   # Interactive open-source manifesto creator
└── README.md                        # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`  
Displays a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, current date/time, and the open-source license that covers the OS (GPL v2).  
**Concepts used:** Variables, `echo`, command substitution `$()`, string formatting.

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`  
Checks whether Git is installed on the system using `rpm` or `dpkg`, displays version and license details, and uses a `case` statement to print a philosophy note about the package.  
**Concepts used:** `if-then-else`, `case` statement, `rpm -qi` / `dpkg -l`, pipe with `grep`.

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_auditor.sh`  
Iterates through a list of important Linux system directories using a `for` loop and reports each directory's size, owner, group, and permissions. Also checks for Git's configuration files.  
**Concepts used:** `for` loop, `ls -ld`, `du -sh`, `awk`, conditional directory checks.

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`  
Accepts a log file path and a keyword as command-line arguments, reads the file line by line using a `while read` loop, counts keyword occurrences, and prints the last 5 matching lines.  
**Concepts used:** `while read` loop, `if-then`, counter variables, `$1` / `$2` arguments, `tail`, `grep`.

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`  
Interactively prompts the user with three questions using `read`, composes a personalised open-source philosophy statement using string concatenation, and saves it to a `.txt` file.  
**Concepts used:** `read` for user input, string concatenation, `>` and `>>` file writing, `date`, alias concept via shell function.

---

## How to Run the Scripts on Linux

### Step 1 — Clone the Repository
```bash
git clone https://github.com/rishav24bce11519/oss-audit-24bce11519.git
cd oss-audit-24bce11915
```

### Step 2 — Make Scripts Executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run Each Script

```bash
# Script 1 — System Identity Report
./script1_system_identity.sh

# Script 2 — FOSS Package Inspector
./script2_package_inspector.sh

# Script 3 — Disk and Permission Auditor
./script3_disk_auditor.sh

# Script 4 — Log File Analyzer (provide a log file path)
./script4_log_analyzer.sh /var/log/syslog error
# OR on Red Hat/Fedora systems:
./script4_log_analyzer.sh /var/log/messages warning

# Script 5 — Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

---

## Dependencies

| Script | Dependencies | Notes |
|--------|-------------|-------|
| Script 1 | `uname`, `whoami`, `uptime`, `date` | All pre-installed on any Linux system |
| Script 2 | `rpm` or `dpkg`, `git`, `grep` | rpm = Red Hat/Fedora; dpkg = Debian/Ubuntu |
| Script 3 | `ls`, `du`, `awk`, `cut` | All standard Linux utilities |
| Script 4 | `grep`, `wc`, `tail` | All standard Linux utilities |
| Script 5 | `date`, `cat` | All standard Linux utilities |

All scripts are written in **Bash** and require a Linux system with Bash shell (version 4.0+).

---

## Notes for Evaluators

- All scripts include inline comments explaining each section.
- Scripts are tested to run on Debian/Ubuntu and Red Hat/Fedora/CentOS systems.
- Script 4 handles edge cases: missing file, empty file, and alternative log locations.
- Script 2 handles both `rpm` and `dpkg` based systems gracefully.

---

## License

This project submission is for educational purposes under VIT's Open Source Software course. The shell scripts are released under the **MIT License** — use, modify, and share freely.

---

*"Given enough eyeballs, all bugs are shallow." — Eric S. Raymond*
