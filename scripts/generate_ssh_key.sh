#!/usr/bin/env bash
#
# SSH Key Generation
#
# This script generates a new SSH key for the current machine if one doesn't
# already exist. The key is named based on the hostname and username.
# The key is protected by a complex passphrase stored in the macOS Keychain.
#
# Usage:
#   ./generate_ssh_key.sh
#
# Note:
# - The passphrase is stored securely in the macOS Keychain.
# - The script uses the default username and hostname for the key filename
#   and the SSH key comment.

set -o errexit
set -o nounset
set -o pipefail

if [ "$(uname -s)" != "Darwin" ]; then
  exit 1
fi

# Ensure required commands are available
for cmd in openssl /usr/bin/ssh-keygen /usr/bin/ssh-add; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is not installed. Please install it to proceed." >&2
        exit 1
    fi
done

# Create .ssh directory if it doesn't exist
SSH_DIR="$HOME/.ssh"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Generate key filename based on hostname and username
HOSTNAME=$(hostname -s)
USERNAME=$(whoami)
KEY_FILENAME="id_ed25519_${HOSTNAME}_${USERNAME}"

KEY_PATH="$SSH_DIR/$KEY_FILENAME"

# Check if SSH key already exists
if [ -f "$KEY_PATH" ]; then
    echo "SSH key already exists at $KEY_PATH. Skipping key generation."
    exit 0
fi

# Generate a complex passphrase
PASSPHRASE=$(openssl rand -base64 32)

# Generate the SSH key using ed25519 with increased KDF rounds
/usr/bin/ssh-keygen -t ed25519 -a 100 -C "${USERNAME}@${HOSTNAME}" -f "$KEY_PATH" -N "$PASSPHRASE"

# Create a temporary script for SSH_ASKPASS
ASKPASS_SCRIPT=$(mktemp)
chmod 700 "$ASKPASS_SCRIPT"
cat > "$ASKPASS_SCRIPT" <<EOF
#!/usr/bin/env bash
echo "$PASSPHRASE"
EOF

# Export SSH_ASKPASS and DISPLAY to use the helper
export SSH_ASKPASS="$ASKPASS_SCRIPT"
export DISPLAY=':0'

# Suppress any stdin from interfering
SSH_ASKPASS_REQUIRE_PASS=1 /usr/bin/ssh-add --apple-use-keychain "$KEY_PATH" < /dev/null

# Clean up the temporary askpass script
rm "$ASKPASS_SCRIPT"

# Ensure the key has the correct permissions
chmod 600 "$KEY_PATH"
chmod 644 "${KEY_PATH}.pub"

PUBLIC_KEY_PATH="${KEY_PATH}.pub"

# Prompt to use ssh-copy-id to add the key to a remote server
echo "Passphrase is stored in the macOS Keychain."
echo "You can manually add the key to remote servers using the following command:"
echo "ssh-copy-id -i $PUBLIC_KEY_PATH user@hostname"

exit 0
