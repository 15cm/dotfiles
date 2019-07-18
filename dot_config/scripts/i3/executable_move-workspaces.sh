#/bin/bash
main_monitor=DP2
for i in $(seq 1 5); do
  i3-msg "[workspace=$i] move workspace to output ${main_monitor}"
done
