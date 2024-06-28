-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
-- maximize window on startup
wezterm.on('gui-startup', function()
    local tab, pane, window = mux.spawn_window({})
    window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.inactive_pane_hsb = {
    saturation = 0.5,
    brightness = 0.5,
}

local image_file = wezterm.home_dir .. '/.config/wezterm/image.jpg'

-- For example, changing the color scheme:
config.color_scheme = 'nord'
config.font = wezterm.font('Hasklug Nerd Font Mono')
config.font_size = 22
config.line_height = 0.8

config.window_background_opacity = 1.0
config.window_background_image = image_file
config.window_background_image_hsb = {
    brightness = 0.2,
    hue = 1.0,
    saturation = 1.0,
}

config.enable_scroll_bar = true
config.scrollback_lines = 5000
-- keybindings
config.disable_default_key_bindings = true
config.leader = { key = 'z', mods = 'SUPER', timeout_milliseconds = 2000 }
config.keys = {
    -- Font size
        -- Linux
    { key = '-', mods = 'ALT', action = act.DecreaseFontSize },
    { key = '=', mods = 'ALT', action = act.IncreaseFontSize },
        -- MacOS
    { key = '-', mods = 'OPT', action = act.DecreaseFontSize },
    { key = '=', mods = 'OPT', action = act.IncreaseFontSize },
    -- Cut & Paste
        -- Linux
    { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
    { key = 'V', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
    { key = 'Copy', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
    { key = 'Paste', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
        -- MacOS
    { key = 'C', mods = 'CMD', action = act.CopyTo('Clipboard') },
    { key = 'V', mods = 'CMD', action = act.PasteFrom('Clipboard') },
    { key = 'Copy', mods = 'CMD', action = act.CopyTo('Clipboard') },
    { key = 'Paste', mods = 'CMD', action = act.PasteFrom('Clipboard') },
    -- Change Tabs
    { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
    { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
    -- Split Panes
    { key = '-', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '|', mods = 'CTRL|SHIFT', action = act.SplitHorizontal {domain = 'CurrentPaneDomain' }, },
    -- Pane Navigation
    { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left', },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right', },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up', },
    { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down', },
}

-- and finally, return the configuration to wezterm
return config
