#!/usr/bin/env bash
set -e

###############################################################################
# Homebrew                                                                    #
###############################################################################

# Ensure curl is installed
if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is not installed. Please install curl to proceed." >&2
    exit 1
fi

# Check for Homebrew
if ! command -v brew >/dev/null 2>&1; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
