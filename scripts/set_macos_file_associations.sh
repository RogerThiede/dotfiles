#!/usr/bin/env bash
#
# macOS File Associations Configuration
#
# This script sets file associations for specific file types on macOS using
# the `duti` tool.
#
# Usage:
#   ./set_macos_file_associations.sh
#
# Prerequisites:
# - duti (install with: brew install duti)
# - VLC Media Player (for media file associations)
# - Visual Studio Code (for text file associations)
#
# Note:
# - Changes take effect immediately for new file opens
# - Existing file associations in Finder may need to be refreshed

set -o errexit
set -o nounset
set -o pipefail

###############################################################################
# Prerequisites Validation                                                    #
###############################################################################

# Ensure `duti` is installed
if ! command -v duti >/dev/null 2>&1; then
    echo "Error: 'duti' is not installed. Please install it using 'brew install duti' and try again." >&2
    exit 1
fi

###############################################################################
# Helper Functions                                                            #
###############################################################################

# Function to set file association only if needed
# While always executing `duti -s "$bundle_id" "$extension" "$role"` will work, this checks
# if the current handler is already set and only echos a message if a change was made.
set_file_association() {
    local bundle_id="$1"
    local extension="$2"
    local role="${3:-all}"  # Default to 'all' if not specified
    
    # Get current default handler
    # `duti -x` returns the bundle ID currently registered for the given extension on line 3
    local current_handler
    current_handler=$(duti -x "${extension}" 2>/dev/null | sed -n '3p' || echo "")
    
    if [[ "$current_handler" != "$bundle_id" ]]; then
        duti -s "$bundle_id" "$extension" "$role"
        echo "  ✓ Associated ${extension} files with ${bundle_id}"
    fi
}

###############################################################################
# Media File Associations                                                     #
###############################################################################

set_file_association "org.videolan.vlc" ".mp4"
set_file_association "org.videolan.vlc" ".mov"
set_file_association "org.videolan.vlc" ".mkv"

###############################################################################
# Text File Associations                                                      #
###############################################################################

set_file_association "com.microsoft.VSCode" ".patch"
set_file_association "com.microsoft.VSCode" ".txt"
set_file_association "com.microsoft.VSCode" ".log"

echo "File associations successfully configured"
