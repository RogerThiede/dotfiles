#!/usr/bin/env bash
#
# Homebrew Installer
#
# This script installs Homebrew package manager on macOS if it's not already
# installed. Homebrew is a package manager that simplifies the installation
# of software on macOS.
#
# Usage:
#   ./install_homebrew.sh
#
# Prerequisites:
# - curl command-line tool
# - macOS operating system (still needs to be tested on Linux)

set -o errexit
set -o nounset
set -o pipefail

###############################################################################
# Prerequisites Validation                                                    #
###############################################################################

if [ "$(uname -s)" != "Darwin" ]; then
  exit 1
fi

# Ensure curl is installed
if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is not installed. Please install curl to proceed." >&2
    exit 1
fi

###############################################################################
# Homebrew Installation                                                       #
###############################################################################

# Check for Homebrew
if ! command -v brew >/dev/null 2>&1; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
