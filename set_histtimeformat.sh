#!/bin/bash

# Define the timestamp format
TIMESTAMP_FORMAT='%F %T '

# Determine which shell configuration file to edit
if [ "$SHELL" = "/bin/bash" ]; then
    CONFIG_FILE="$HOME/.bashrc"
elif [ "$SHELL" = "/bin/zsh" ]; then
    CONFIG_FILE="$HOME/.zshrc"
else
    echo "Unsupported shell. This script supports bash and zsh only."
    exit 1
fi

# Check if HISTTIMEFORMAT is already set
if grep -q 'export HISTTIMEFORMAT=' "$CONFIG_FILE"; then
    echo "HISTTIMEFORMAT is already set in $CONFIG_FILE."
else
    # Add HISTTIMEFORMAT to the configuration file
    echo "export HISTTIMEFORMAT=\"$TIMESTAMP_FORMAT\"" >> "$CONFIG_FILE"
    echo "Added HISTTIMEFORMAT to $CONFIG_FILE."
fi

# Source the configuration file to apply changes
source "$CONFIG_FILE"
echo "Applied changes. Timestamp format is now set for history commands."
