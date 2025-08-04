#!/bin/bash
#
# CFS Gruvbox Material Color Palette
# Based on cfsanderson/cfs-gruvbox-material Neovim theme
# Configuration: Material foreground + Hard background
#
# This is the master color palette file for shell scripts and non-CSS configurations.
# Source this file in your shell scripts to access color variables.
#
# Usage Examples:
#   source /home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-palette.sh
#   echo -e "${fg0}Hello${reset} ${bg3}World${reset}"
#   hyprctl keyword general:col.active_border "rgb(${grey2//#/})"

# ==========================================
# BACKGROUND COLORS
# ==========================================

# Primary backgrounds - core window/panel colors
export bg_dim="#141617"        # Darkest background - unused areas, deep shadows
export bg0="#1a1919"           # Main background - primary window background (from Normal)
export bg1="#282828"           # Secondary background - panels, status bars (from StatusLine)
export bg2="#282828"           # Tertiary background - same as bg1 in this variant
export bg3="#3c3836"           # UI element background - buttons, input fields (from Visual)
export bg4="#3c3836"           # Interactive element background - same as bg3
export bg5="#504945"           # Highlighted background - hover states, selections (from TabLine)

# Background status colors - colored backgrounds for alerts/status
export bg_red="#ea6962"        # Error/danger background
export bg_green="#a9b665"      # Success/safe background
export bg_yellow="#d8a657"     # Warning/caution background

# ==========================================
# FOREGROUND COLORS
# ==========================================

# Primary text colors
export fg0="#e5dac7"           # Primary foreground - main text, bright emphasis (from Normal)
export fg1="#ddc7a1"           # Secondary foreground - subtext, less emphasis (from StatusLine)

# ==========================================
# SEMANTIC COLORS
# ==========================================

# Standard color palette - syntax highlighting, status indicators
export red="#ea6962"           # Errors, deletion, urgent states
export orange="#e78a4e"        # Warnings, modified states, orange accents
export yellow="#d8a657"        # Warnings, pending states, highlights
export green="#a9b665"         # Success, addition, safe states
export aqua="#89b482"          # Info, cyan accents, special highlights
export blue="#7daea3"          # Links, info states, blue accents
export purple="#d3869b"        # Special elements, purple accents

# ==========================================
# GREY SCALE
# ==========================================

# Grey variants for subtle elements
export grey0="#504945"         # Dark grey - disabled text, subtle borders (from LineNr)
export grey1="#928374"         # Medium grey - secondary text, muted elements (from Comment)
export grey2="#928374"         # Light grey - active borders, emphasized subtle elements (from CursorLineNr)

# Additional background greys
export dark0_hard="#1a1919"    # Alias for bg0 - hardest background
export dark1="#3c3836"         # Alias for bg3 - UI elements
export dark2="#504945"         # Alias for bg5 - hover/selection
export dark3="#665c54"         # Border color - subtle separators
export dark4="#7c6f64"         # Border color - more prominent separators

# ==========================================
# WORKSPACE/UI SPECIFIC COLORS
# ==========================================

# Workspace/window management colors
export workspace_inactive="$grey0"      # Inactive workspace indicators
export workspace_active="$fg0"          # Active workspace indicators
export workspace_urgent="$red"          # Urgent workspace indicators
export workspace_hover="$grey2"         # Hover state for workspace elements

# Border and separator colors
export border_subtle="$dark3"           # Subtle borders between elements
export border_emphasis="$grey2"         # Emphasized borders, active window borders
export border_urgent="$red"             # Urgent/error borders

# Selection and highlight colors
export selection_bg="$bg3"              # Text/item selection background
export selection_fg="$fg0"              # Text/item selection foreground
export highlight_bg="$bg5"              # General highlight background
export highlight_fg="$fg0"              # General highlight foreground

# Notification and alert colors
export notification_bg="$bg1"           # Notification background
export notification_fg="$fg1"           # Notification text
export notification_border="$grey1"     # Notification border

# ==========================================
# ACCESSIBILITY & CONTRAST
# ==========================================

# High contrast pairs for accessibility
export text_primary="$fg0"              # Primary readable text
export text_secondary="$fg1"            # Secondary readable text
export text_muted="$grey1"              # Muted/disabled text
export text_on_dark="$fg0"              # Text on dark backgrounds
export text_on_colored="$bg0"           # Text on colored backgrounds

# Background contrast levels
export surface_lowest="$bg0"            # Lowest elevation surface
export surface_low="$bg1"               # Low elevation surface
export surface_medium="$bg3"            # Medium elevation surface
export surface_high="$bg5"              # High elevation surface

# ==========================================
# UTILITY FUNCTIONS
# ==========================================

# Function to convert hex to RGB values (useful for Hyprland)
hex_to_rgb() {
    local hex="$1"
    # Remove # if present
    hex="${hex#\#}"
    
    # Extract RGB components
    local r=$((16#${hex:0:2}))
    local g=$((16#${hex:2:2}))
    local b=$((16#${hex:4:2}))
    
    echo "$r $g $b"
}

# Function to get hex without # prefix (useful for some configs)
hex_clean() {
    local hex="$1"
    echo "${hex#\#}"
}

# Function to format color for terminal output
term_color() {
    local color="$1"
    local text="$2"
    echo -e "\033[38;2;$(hex_to_rgb "$color" | tr ' ' ';')m${text}\033[0m"
}

# Reset terminal color
export reset="\033[0m"

# ==========================================
# USAGE EXAMPLES
# ==========================================

# Example function to demonstrate usage
demo_colors() {
    echo "CFS Gruvbox Material Color Palette Demo"
    echo "======================================"
    echo
    
    echo "Background Colors:"
    term_color "$bg0" "  bg0 (main background): $bg0"
    term_color "$bg1" "  bg1 (secondary): $bg1"
    term_color "$bg3" "  bg3 (UI elements): $bg3"
    term_color "$bg5" "  bg5 (highlights): $bg5"
    echo
    
    echo "Foreground Colors:"
    term_color "$fg0" "  fg0 (primary text): $fg0"
    term_color "$fg1" "  fg1 (secondary text): $fg1"
    echo
    
    echo "Semantic Colors:"
    term_color "$red" "  red: $red"
    term_color "$orange" "  orange: $orange"
    term_color "$yellow" "  yellow: $yellow"
    term_color "$green" "  green: $green"
    term_color "$aqua" "  aqua: $aqua"
    term_color "$blue" "  blue: $blue"
    term_color "$purple" "  purple: $purple"
    echo
    
    echo "Grey Scale:"
    term_color "$grey0" "  grey0: $grey0"
    term_color "$grey1" "  grey1: $grey1"
    term_color "$grey2" "  grey2: $grey2"
    echo
}

# ==========================================
# CONFIGURATION HELPERS
# ==========================================

# Helper for Hyprland color format (removes # prefix)
hypr_color() {
    local color="$1"
    echo "rgb($(hex_clean "$color"))"
}

# Helper for waybar/CSS format (keeps # prefix)
css_color() {
    local color="$1"
    echo "$color"
}

# Helper for terminal 256 color approximation
# Note: This is approximate - true colors are preferred when available
term_256_color() {
    local hex="$1"
    # This would need a more complex conversion function
    # For now, just return the hex for true color terminals
    echo "$hex"
}