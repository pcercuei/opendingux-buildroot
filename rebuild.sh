#!/bin/sh

# Get the latest version.
echo "Updating local git repository..."
git pull

# Use the default config and patch it to point to our install location.
make a320_defconfig
sed -ie 's%^BR2_HOST_DIR=.*$%BR2_HOST_DIR="/opt/a320-toolchain"%' .config

# Clear the install location.
echo "Clearing install location..."
rm -rf /opt/a320-toolchain

# Clear the build location.
echo "Clearing build location..."
rm -rf output/

# Remove non-versioned packages: they might have been updated since the last build.
rm -f dl/dingux-commander-*.tar.gz
rm -f dl/gmenu2x-*.tar.gz
rm -f dl/libopk-*.tar.gz
rm -f dl/libxdgmime-*.tar.gz
rm -f dl/pyclock-*.tar.gz
rm -f dl/pwswd-*.tar.gz

# Perform the build.
echo "Starting build..."
make

# Create packages.
echo "Creating packages..."
tar -C/opt --exclude='.fakeroot.*' -jcf opendingux-a320-toolchain.`date +'%Y-%m-%d'`.tar.bz2 a320-toolchain
