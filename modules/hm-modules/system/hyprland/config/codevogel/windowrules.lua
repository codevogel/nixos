hl.window_rule({
	name = "Godot Float Internal Windows",
	match = {
		class = "^Godot$",
	},
	tile = false,
	float = true,
})

hl.window_rule({
	name = "Godot Tile Main Window",
	match = {
		class = "^Godot$",
		initial_title = "^Godot$",
	},
	tile = true,
	float = false,
})
