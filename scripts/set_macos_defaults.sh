#!/usr/bin/env bash
#
# Sets my preferred macOS defaults.
#
# Inspiration from https://mths.be/macos

set -o errexit

if [ "$(uname -s)" != "Darwin" ]; then
  exit 1
fi

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Show the date (0 = When Space Allows, 1 = Always, 2 = Never)
# in the menu bar clock with day of the week and AM/PM
defaults write com.apple.menuextra.clock ShowDate -int 0
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock ShowAMPM -bool true

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto corrections
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct

# Save screen captures to clipboard by default
defaults write com.apple.screencapture target -string "clipboard"

###############################################################################
# Finder                                                                      #
###############################################################################

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand all the following File Info panes
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  Comments -bool true \
  MetaData -bool true \
  Name -bool true \
  OpenWith -bool true \
  Preview -bool true \
  Privileges -bool true

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

# Set the default window profile to "Homebrew"
defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"

# Set the startup window profile to "Homebrew"
defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"

# Close terminal windows on successful exit code
/usr/libexec/PlistBuddy -c "Set 'Window Settings':Homebrew:shellExitAction 1" ~/Library/Preferences/com.apple.Terminal.plist

###############################################################################
# Calendar                                                                    #
###############################################################################

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true
