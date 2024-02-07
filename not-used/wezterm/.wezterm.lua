-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local gpus = wezterm.gui.enumerate_gpus()

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.font = wezterm.font("Lilex Nerd Font Propo")
config.font_size = 14
config.window_padding = {
	left = 5,
	right = 0,
	top = 4,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.default_domain = "WSL:Arch"
config.front_end = "WebGpu"

config.webgpu_preferred_adapter = gpus[2]
config.animation_fps = 165
config.max_fps = 165

-- and finally, return the configuration to wezterm
return config
