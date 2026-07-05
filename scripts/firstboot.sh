#!/bin/bash
set -e
echo "=== ServerOS First Boot ==="
IFACE=$(nmcli -t -f DEVICE,TYPE device status | awk -F: '$2=="wifi"{print $1;exit}')
[ -z "$IFACE" ] && { echo "No Wi-Fi adapter found"; exit 0; }
mapfile -t SSIDS < <(nmcli -t -f SSID device wifi list | awk -F: 'NF && !seen[$1]++{print $1}')
echo "Select Wi-Fi:"
select S in "${SSIDS[@]}"; do
 [ -n "$S" ] && break
done
read -rsp "Password: " PASS; echo
nmcli device wifi connect "$S" password "$PASS"
systemctl disable firstboot.service || true
rm -f /usr/local/bin/firstboot.sh
echo "Setup complete."
