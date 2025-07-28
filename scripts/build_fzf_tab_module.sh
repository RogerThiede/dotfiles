#!/usr/bin/env bash
#
# fzf-tab Binary Module Builder
#
# This script builds the fzf-tab binary module for improved performance
# when colorizing large numbers of files during tab completion. This script is
# idempotent and will skip building if the module already exists.
# The binary module replaces the slower pure zsh implementation.
#
# Usage:
#   ./build_fzf_tab_module.sh
#
# Prerequisites:
# - autoconf
# - fzf-tab submodule initialized

set -o errexit
set -o nounset
set -o pipefail

###############################################################################
# fzf-tab Binary Module                                                       #
###############################################################################

# Configuration
FZF_TAB_DIR="$HOME/.dotfiles/symlinks/zsh/fzf-tab"
FZF_TAB_MODULE_PATH="$FZF_TAB_DIR/modules/Src/aloxaf/fzftab.so"

# Check if the binary module already exists
if [[ -f "$FZF_TAB_MODULE_PATH" ]]; then
    exit 0
fi

# Check if fzf-tab directory exists
if [[ ! -d "$FZF_TAB_DIR" ]]; then
    echo "Error: fzf-tab directory not found. Please ensure submodules are initialized." >&2
    exit 1
fi

# Check if autoconf is available
if ! command -v autoconf >/dev/null 2>&1; then
    echo "Error: autoconf is required but not installed. Please install it." >&2
    exit 1
fi

# Build the module
cd "$FZF_TAB_DIR"
zsh -c "source fzf-tab.zsh && build-fzf-tab-module"

echo "fzf-tab binary module built successfully"
