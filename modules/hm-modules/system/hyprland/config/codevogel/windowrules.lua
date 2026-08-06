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

hl.window_rule({
	name = "tvt clients",
	match = {
		initial_class = "tvt",
	},
	tile = true,
	float = false,
	workspace = 3,
})
