#!/bin/sh
# Run before every push so open copies of the app see a newer build and reload.
# Works with both macOS (BSD) and Linux (GNU) sed: -i.bak then remove the backup.
N=$(date +%s)
sed -i.bak "s/name=\"mb-build\" content=\"[0-9]*\"/name=\"mb-build\" content=\"$N\"/; s/var B=\"[0-9]*\"/var B=\"$N\"/" index.html && rm -f index.html.bak
sed -i.bak "s/^Last updated:.*/Last updated: $(TZ=America/New_York date '+%b %-d, %Y · %-I:%M %p') ET./" README.md && rm -f README.md.bak
echo "stamped $N"
