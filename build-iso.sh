#!/bin/bash
set -e

PROFILE="$1"

if [ -z "$PROFILE" ]; then
    echo "Usage: $0 <profile>"
    echo "Example: ./build-iso.sh desktop"
    exit 1
fi

if [ ! -d "profiles/$PROFILE" ]; then
    echo "Profile '$PROFILE' not found in profiles/"
    exit 1
fi

echo "Preparing ISO build environment for profile: $PROFILE"

# Create workspace directory if missing
mkdir -p build-workspace

echo "Workspace is ready at build-workspace/"
echo ""
echo "Next steps:"
echo "1. Launch Cubic."
echo "2. Set 'build-workspace/' as your project directory."
echo "3. Enter the chroot environment."
echo "4. Inside chroot, clone your repository or mount it:"
echo "       git clone https://github.com/goblinshadow316/LINU-linux.git"
echo "   OR mount it using Cubic's project files panel."
echo ""
echo "5. Inside the chroot, run:"
echo "       bash LINU-linux/apply-profile.sh $PROFILE"
echo ""
echo "6. Finish the Cubic process and build your ISO."
echo ""
echo "Build environment setup complete."
