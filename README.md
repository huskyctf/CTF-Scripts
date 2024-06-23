# CTF-Scripts
Time-saving scripts to automate repetitive tasks when starting a new CTF challenge.

## Quick folder setup
If using a temporary cloud instance of an attacking machine, then quickly setting up a familar folder layout can help with workflow. Make a new directory and then execute the setup-folders script:
```bash
mkdir ctf && cd ctf
curl -s https://raw.githubusercontent.com/huskyctf/CTF-Scripts/main/setup-folders.sh | bash /dev/stdin .
```
