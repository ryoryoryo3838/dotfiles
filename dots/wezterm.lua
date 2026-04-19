local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 外観のシンプル化
-- config.color_scheme = "Solarized Dark Higher Contrast (Gogh)" -- 落ち着いたダークテーマ
config.color_scheme = "tokyonight"
config.font = wezterm.font("PlemolJP Console NF") -- 読みやすいフォント
config.font_size = 11.0

-- UIのノイズを消す
config.window_decorations = "RESIZE" -- タイトルバーを消して境界線のみに
config.hide_tab_bar_if_only_one_tab = true -- タブが1つの時はバーを隠す
config.use_dead_keys = false -- 入力の引っ掛かりを防止

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup()
tabline.set_theme("tokyonight")

tabline.apply_to_config(config)

-- key config

config.keys = {
	{
		key = ":",
		mods = "CTRL|ALT|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}
config.window_padding = {
	left = 20,
	right = 10,
	top = 10,
	bottom = 10,
}

config.xim_im_name = "fcitx"
config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = false
config.use_ime = true
return config
