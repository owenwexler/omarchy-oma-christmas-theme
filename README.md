# Omachristmas

A Christmas theme for Omarchy: midnight blue, snowy text, evergreen, red,
gold, icy blue, and gingerbread brown. Extends
[ChaseRensberger’s Christmas.nvim](https://github.com/ChaseRensberger/christmas.nvim)
with brighter accents, additional syntax groups, and readable diff backgrounds.
App coverage is inspired by
[All Hallow’s Eve](https://github.com/guilhermetk/omarchy-all-hallows-eve-theme).

## Use this working copy

From this repository, link your local theme and apply it:

```sh
mkdir -p ~/.config/omarchy/themes
ln -s "$PWD" ~/.config/omarchy/themes/omachristmas
omarchy theme set omachristmas
```

If that destination already exists, inspect it before replacing it. Older
Omarchy versions use `omarchy-theme-set omachristmas` instead.
Neovim’s Lazy plugin manager downloads Christmas.nvim on first use; restart
Neovim and let installation finish. Internet access is needed for that step.

Current Omarchy treats a symlink to your own working copy as a local theme.
Themes cloned directly by `omarchy theme install` have Lua and terminal configs
filtered and regenerated from `colors.toml`. That install path retains the
palette but **does not load this Christmas.nvim extension or the 90% terminal
opacity settings**. Use the local working-copy link for the complete theme.

## Coverage

- Hyprland: green/red active border; configs for both legacy and Lua versions.
- Neovim: upstream Christmas UI, green strings/types, red keywords, gold
  functions/numbers, blue constants, brown preprocessor/markup accents.
- Alacritty, Ghostty, Kitty, Foot: midnight backgrounds at 90% opacity and a
  matching 16-color palette. Opacity may require restarting the terminal and
  can be overridden by your personal terminal settings.
- BTOP: coordinated graph, process, and meter colors.
- Waybar: transparent bar, white text, green active workspace, red urgency.
- Walker, Mako, SwayOSD, Hyprlock, and Papirus-Dark icons.
- Current Omarchy: `colors.toml` supplies generated app themes; `shell.bar.toml`
  gives its replacement status bar the same transparent, white-text styling.

Legacy components only consume their matching files when present in your
Omarchy installation. This theme does not install those applications.

## Palette

| Role | Color |
| --- | --- |
| Night sky | `#0a1428` |
| UI surface | `#1a2a3a` |
| Text | `#e0e6ed` |
| Muted/comments | `#8b95a5` |
| Green | `#3fbd52` |
| Red | `#ff5558` |
| Gold | `#ffb84d` |
| Ice blue | `#7fbfff` |
| Snow | `#ffffff` |
| Gingerbread | `#c9976b` |

The ANSI magenta slot intentionally uses gingerbread brown. Terminal programs
that request magenta will therefore use brown.

## Wallpaper

`backgrounds/01-night-sky-placeholder.png` is a plain 3840×2160 midnight-blue
placeholder. Replace it with your rendered Christmas wallpaper (PNG, JPEG, or
WebP). Remove the placeholder when the final image is ready, then reapply the
theme. A dark wallpaper preserves contrast behind transparent surfaces.

## Development

`colors.toml` is the palette for current Omarchy’s generated integrations.
Explicit legacy files and the Neovim extension carry their own color values;
keep them synchronized when changing the palette. No upstream theme source
is vendored: Christmas.nvim is loaded as a plugin dependency.
