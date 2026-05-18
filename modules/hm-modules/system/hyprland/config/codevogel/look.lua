hl.config({
	general = {
		border_size = 2,
		gaps_in = 5,
		gaps_out = 5,
		no_focus_fallback = true,
		resize_on_border = true,
	},
	decoration = {
		rounding = 5,
		dim_inactive = true,
		dim_strength = 0.4,
	},
})

hl.animation({ leaf = "workspaces", enabled = false })

local function toggleZenMode()
	hl.config({ decoration = { dim_inactive = not hl.get_config("decoration.dim_inactive") } })
end

return {
	toggleZenMode = toggleZenMode,
}
