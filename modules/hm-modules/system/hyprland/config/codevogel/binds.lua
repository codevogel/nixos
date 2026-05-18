local mainMod = "SUPER"

local terminal = "kitty"
local webBrowser = "firefox"
local launcher = "walker"
local musicPlayer = "spotify"

-- Exit Hyprland
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))
-- Close focused window
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())

-- Launching applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(musicPlayer))

-- Workspace keys
for i = 1, 5 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ last = {} }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Screenshot / record
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("peck --clipboard --temp --freeze"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("peck --record --clipboard --temp"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("peck --record --clipboard --temp --format=gif"))

-- Window management
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.submap("manageWindows"))
hl.define_submap("manageWindows", function()
	local step = 100
	hl.bind("H", hl.dsp.focus({ direction = "l" }))
	hl.bind("J", hl.dsp.focus({ direction = "d" }))
	hl.bind("K", hl.dsp.focus({ direction = "u" }))
	hl.bind("L", hl.dsp.focus({ direction = "r" }))
	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -step, y = 0, relative = "true" }), { repeating = true })
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x = 0, y = step, relative = "true" }), { repeating = true })
	hl.bind("SHIFT + K", hl.dsp.window.resize({ x = 0, y = -step, relative = "true" }), { repeating = true })
	hl.bind("SHIFT + L", hl.dsp.window.resize({ x = step, y = 0, relative = "true" }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Zen mode toggle
local look = require("codevogel.look")
hl.bind(mainMod .. " + Z", look.toggleZenMode)

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
-- These require playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
