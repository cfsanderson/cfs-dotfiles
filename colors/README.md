# CFS Gruvbox Material Color Palette

This directory contains the master color palette for all dotfiles configurations, based on the `cfsanderson/cfs-gruvbox-material` Neovim theme with material foreground and hard background settings.

## Files

- **`gruvbox-material-palette.css`** - CSS variables for web-based configs (waybar, etc.)
- **`gruvbox-material-palette.sh`** - Shell variables for scripts and configs
- **`gruvbox-material-wofi.css`** - GTK @define-color variables for wofi
- **`gruvbox-material-mako.conf`** - Color template for mako notifications
- **`gruvbox-material-palette.toml`** - TOML color values for yazi, starship, etc.
- **`color-preview.html`** - Interactive color reference and testing tool
- **`README.md`** - This documentation file

## Usage

### CSS Configurations (Waybar)

Import the CSS palette in your stylesheets:

```css
@import "/home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-palette.css";

/* Use CSS variables */
.my-element {
    background-color: var(--bg0);
    color: var(--fg0);
    border: 1px solid var(--border-subtle);
}

/* Workspace styling example */
#workspaces button {
    color: var(--workspace-inactive);
    background-color: var(--bg0);
}

#workspaces button.active {
    color: var(--workspace-active);
    background-color: var(--bg3);
}
```

### GTK Configurations (Wofi)

Import the GTK color definitions:

```css
@import "/home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-wofi.css";

/* Use GTK @define-color variables */
window {
    background-color: @base;
    color: @text;
    border: 1px solid @border;
}

#entry:selected {
    background-color: @bg-hover;
    color: @selected-text;
}
```

### Shell Scripts and Configuration Files

Source the shell palette in your scripts:

```bash
#!/bin/bash
source "/home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-palette.sh"

# Use color variables
echo -e "${fg0}Primary text${reset}"
echo -e "${red}Error message${reset}"

# For Hyprland configs
echo "general { col.active_border = $(hypr_color "$grey2") }"
```

### Hyprland Configuration

```bash
# In hyprland config files, source the palette and use helper functions
source = /home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-palette.sh

general {
    col.active_border = rgb(a89984)     # Use $grey2 value
    col.inactive_border = rgb(3c3836)   # Use $bg3 value
}
```

### Configuration File Templates

#### Mako Notifications
Copy colors from the template file:
```bash
# Reference: colors/gruvbox-material-mako.conf
background-color=#1a1919    # --bg0: main background
text-color=#e5dac7          # --fg0: primary text
border-color=#928374        # --grey2: emphasized borders
```

#### TOML Configurations (Yazi, Starship, etc.)
Reference the TOML palette file:
```toml
# From colors/gruvbox-material-palette.toml
[mgr]
cwd = { fg = "#d8a657" }    # yellow for current directory

[status] 
progress_label = { fg = "#e5dac7", bold = true }  # fg0 for progress
progress_error = { fg = "#ea6962", bg = "#3c3836" }  # red on bg3
```

## Color Categories

### Backgrounds
- `--bg0` / `$bg0` - Main window background
- `--bg1` / `$bg1` - Secondary panels  
- `--bg3` / `$bg3` - Interactive elements
- `--bg5` / `$bg5` - Hover/selection states

### Text
- `--fg0` / `$fg0` - Primary text
- `--fg1` / `$fg1` - Secondary text
- `--grey1` / `$grey1` - Muted text

### Semantic Colors
- `--red` / `$red` - Errors, urgent states
- `--green` / `$green` - Success, safe states  
- `--yellow` / `$yellow` - Warnings, highlights
- `--blue` / `$blue` - Info, links
- `--purple` / `$purple` - Special elements
- `--orange` / `$orange` - Modified states
- `--aqua` / `$aqua` - Accents, special highlights

### UI Elements
- `--workspace-active` / `$workspace_active` - Active workspace indicators
- `--workspace-inactive` / `$workspace_inactive` - Inactive workspaces
- `--border-emphasis` / `$border_emphasis` - Active borders
- `--border-subtle` / `$border_subtle` - Subtle separators

## Converting Existing Configs

### Step 1: Identify Current Colors
Review your existing config files and identify hardcoded hex colors.

### Step 2: Map to Palette
Match existing colors to the closest palette equivalent:
- `#282828` → `var(--bg1)` or `$bg1`
- `#d4be98` → `var(--fg0)` or `$fg0`  
- `#a89984` → `var(--grey2)` or `$grey2`

### Step 3: Update Configuration
Replace hardcoded values with palette references.

### Step 4: Test and Adjust
Verify the visual appearance matches your expectations.

## Utility Functions (Shell Only)

The shell palette includes helpful utility functions:

```bash
# Convert hex to RGB values (for Hyprland)
rgb_values=$(hex_to_rgb "$red")  # Returns "234 105 98"

# Get hex without # prefix
clean_hex=$(hex_clean "$fg0")    # Returns "d4be98"

# Format color for Hyprland
hypr_red=$(hypr_color "$red")    # Returns "rgb(ea6962)"

# Display terminal color
term_color "$green" "Success message"

# Demo all colors
demo_colors
```

## Configuration Examples

### Waybar

```css
@import "/home/caleb/Projects/arch-dotfiles/colors/gruvbox-material-palette.css";

#workspaces button {
    color: var(--workspace-inactive);
    background-color: transparent;
}

#workspaces button.active {
    color: var(--workspace-active);
    background-color: var(--bg3);
}
```

### Mako Notifications

```ini
background-color=#1d2021
text-color=#d4be98
border-color=#a89984
border-size=2
```

### Hyprland

```conf
general {
    col.active_border = rgb(a89984)
    col.inactive_border = rgb(3c3836)
}
```

## Maintaining Consistency

When adding new applications or themes:

1. **Always reference the master palette** instead of defining new colors
2. **Use semantic color names** (e.g., `--red` for errors, not `--color1`)  
3. **Test accessibility** - ensure sufficient contrast between text and backgrounds
4. **Document custom mappings** if you need application-specific color assignments

## Color Philosophy

This palette follows the CFS Gruvbox Material philosophy:
- **High contrast** for reduced eye strain
- **Warm, earthy tones** for comfortable extended use
- **Consistent semantics** across all applications
- **Material design influence** in foreground treatment
- **Hard background variant** for maximum contrast

The palette prioritizes readability and visual hierarchy while maintaining the distinctive Gruvbox aesthetic with enhanced contrast and material design principles.