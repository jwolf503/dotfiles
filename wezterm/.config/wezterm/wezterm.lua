local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Wild Cherry (Gogh)"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 15

return config
