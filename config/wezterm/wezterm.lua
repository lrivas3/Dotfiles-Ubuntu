-- -------------------------------------------------------------------
-- rxyhn's aesthetic wezterm configuration
-- A GPU-accelerated cross-platform terminal emulator and multiplexer
--
-- https://github.com/rxyhn
-- -------------------------------------------------------------------

local wezterm = require("wezterm")

-- local function font_with_fallback(name, params)
-- local names = { name, "FiraCode Nerd Font"}
-- return wezterm.font_with_fallback(names, params)
-- end

local font_name = "JetBrains Mono"

return {
	-- -- OpenGL for GPU acceleration, Software for CPU
	-- front_end = "OpenGL",

	-- Font config
-- 	font = font_with_fallback(font_name),
-- 	font_rules = {
-- 	{
-- 	italic = true,
-- 	font = font_with_fallback(font_name, { italic = true }),
-- 	},
-- 	{
-- 	italic = true,
-- 	intensity = "Bold",
-- 	font = font_with_fallback(font_name, { italic = true, bold = true }),
-- 	},
-- 	{
-- 	intensity = "Bold",
-- 	font = font_with_fallback(font_name, { bold = true }),
-- 	},
-- 	},
	warn_about_missing_glyphs = true,
	font_size = 15,
	line_height = 1.0,
	-- Cursor style
	default_cursor_style = "BlinkingBar",

	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
    {
      key = '+',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.IncreaseFontSize,
    },
    {
      key = '-',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.DecreaseFontSize,
    },
    {
      key = '0',
      mods = 'CTRL',
      action = wezterm.action.ResetFontSize
    },
		{
			key = "Enter",
			mods = "SHIFT|ALT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "Enter",
			mods = "SHIFT|CTRL",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "UpArrow",
			mods = "CTRL",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "DownArrow",
			mods = "CTRL",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},
		{ -- browser-like bindings for tabbing
			key = "t",
			mods = "CTRL",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		}, -- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},

	-- Colorschemes 

	-- color_scheme = "Aurora",
	-- color_scheme = "Ayu",
	-- color_scheme = "AyuDark (Gogh)",
  color_scheme = 'tokyonight_moon',
  -- color_scheme = 'tokyonight_storm',
	-- color_scheme = "Dracula",
	-- color_scheme = "Ayu Mirage",
	-- color_scheme = "Atom",

	bold_brightens_ansi_colors = true,

	-- Padding
	window_padding = {
		left = 25,
		right = 25,
		top = 25,
		bottom = 25,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	-- show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = false,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 0.90,
	-- window_frame = { active_titlebar_bg = "#090909", font = font_with_fallback(font_name, { bold = true }) }
  window_frame = { active_titlebar_bg = "#090909"},
}
