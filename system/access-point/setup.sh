#!/bin/bash
set -e

echo "[1/4] Installing packages..."
sudo apt update
sudo apt install -y hostapd dnsmasq net-tools

echo "[2/4] Disabling systemd-resolved (conflict with dnsmasq)..."
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo rm -f /etc/resolv.conf
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
sudo cp NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
sudo systemctl restart NetworkManager

echo "[3/4] Applying configuration files..."
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp wlan0 /etc/network/interfaces.d/
sudo sed -i 's|#DAEMON_CONF=""|DAEMON_CONF="/etc/hostapd/hostapd.conf"|' /etc/default/hostapd

echo "[4/4] Enabling services..."
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl enable dnsmasq

echo "Setup complete. Reboot to activate AP."
