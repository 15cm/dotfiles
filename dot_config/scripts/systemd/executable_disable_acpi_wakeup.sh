#! /usr/bin/sh
# Add your candidates below but make sure that no pattern matches more than one device in /proc/acpi/wakeup
CANDIDATES="EHC1 EHC2 XHC"
for ACPIDEV in $CANDIDATES; do
  ACTIVE=$(grep enabled /proc/acpi/wakeup | cut -f 1 | grep "$ACPIDEV")
  if [ -n "$ACTIVE" ]; then 
    echo "$ACTIVE" > /proc/acpi/wakeup
    echo "DEBUG: disabled -$ACTIVE-" >&2
  else
    echo "DEBUG: no active -$ACPIDEV- found." >&2
  fi
done
