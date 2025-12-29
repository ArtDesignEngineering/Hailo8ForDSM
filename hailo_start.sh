#!/bin/sh
# 1. Load the compiled Hailo driver
# Replace with your actual path
INSMOD_PATH="/volume1/path/to/your/hailo_pci_4.21.0.ko"
if [ -f "$INSMOD_PATH" ]; then
    insmod "$INSMOD_PATH"
    # Wait for the kernel to register the device hardware
    sleep 3
else
    echo "Error: hailo_pci_4.21.0.ko not found at $INSMOD_PATH"
    exit 1
fi
# 2. Dynamically create the /dev/hailo0 node
MAJOR=$(grep hailo /proc/devices | awk '{print $1}')
if [ -n "$MAJOR" ]; then
    # Remove existing node if it exists to avoid conflicts
    rm -f /dev/hailo0
    # Create character device node
    sudo mknod /dev/hailo0 c $MAJOR 0
    # Set permissions so the Frigate container can access it
    chmod 666 /dev/hailo0
    echo "Hailo-8 initialized successfully on major $MAJOR"
else
    echo "Error: Hailo driver loaded but hardware not found in /proc/devices"
    exit 1
fi 
