local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 外観のシンプル化
config.color_scheme = 'Solarized Dark Higher Contrast (Gogh)' -- 落ち着いたダークテーマ
config.font = wezterm.font('PlemolJP Console NF') -- 読みやすいフォント
config.font_size = 11.0

-- UIのノイズを消す
-- config.window_decorations = "RESIZE" -- タイトルバーを消して境界線のみに
config.hide_tab_bar_if_only_one_tab = true -- タブが1つの時はバーを隠す
config.use_dead_keys = false -- 入力の引っ掛かりを防止

-- ウィンドウの透明度と余白
config.window_background_opacity = 0.95 -- ほんの少しだけ透けさせる
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

return config
