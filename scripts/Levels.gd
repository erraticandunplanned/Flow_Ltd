extends Node

var menu_levels = {
	Global.main_menu: {
		Global.flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(288,288)]
		},
		Global.goal_dictionary: {
			Color(0.827451, 0.827451, 0.827450, 1): Vector2(416,288),
			Color(0.827451, 0.827450, 0.827451, 1): Vector2(288,416),
			Color(0.827450, 0.827451, 0.827451, 1): Vector2(416,224),
			Color(0.827451, 0.827451, 0.827451, 1): Vector2(160,288),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	},
	Global.level_select: {
		Global.flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(32,96)]
		},
		Global.goal_dictionary: {
			Color(0.827451, 0.827451, 0.827451, 1): Vector2(32,160),
			Color(0.827450, 0.827450, 0.827450, 1): Vector2(96,96),
			Color(0.827449, 0.827449, 0.827449, 1): Vector2(160,96),
			Color(0.827448, 0.827448, 0.827448, 1): Vector2(224,96),
			Color(0.827447, 0.827447, 0.827447, 1): Vector2(288,96),
			Color(0.827446, 0.827446, 0.827446, 1): Vector2(352,96),
			Color(0.827445, 0.827445, 0.827445, 1): Vector2(416,96),
			Color(0.827444, 0.827444, 0.827444, 1): Vector2(96,160),
			Color(0.827443, 0.827443, 0.827443, 1): Vector2(160,160),
			Color(0.827442, 0.827442, 0.827442, 1): Vector2(224,160),
			Color(0.827441, 0.827441, 0.827441, 1): Vector2(288,160),
			Color(0.827440, 0.827440, 0.827440, 1): Vector2(352,160),
			Color(0.827439, 0.827439, 0.827439, 1): Vector2(416,160),
			Color(0.827438, 0.827438, 0.827438, 1): Vector2(96,224),
			Color(0.827437, 0.827437, 0.827437, 1): Vector2(160,224),
			Color(0.827436, 0.827436, 0.827436, 1): Vector2(224,224),
			Color(0.827435, 0.827435, 0.827435, 1): Vector2(288,224),
			Color(0.827434, 0.827434, 0.827434, 1): Vector2(352,224),
			Color(0.827433, 0.827433, 0.827433, 1): Vector2(416,224),
			Color(0.827432, 0.827432, 0.827432, 1): Vector2(96,288),
			Color(0.827431, 0.827431, 0.827431, 1): Vector2(160,288),
			Color(0.827430, 0.827430, 0.827430, 1): Vector2(224,288),
			Color(0.827429, 0.827429, 0.827429, 1): Vector2(288,288),
			Color(0.827428, 0.827428, 0.827428, 1): Vector2(352,288),
			Color(0.827427, 0.827427, 0.827427, 1): Vector2(416,288),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(480,96),
				Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	},
	Global.about: {
		Global.flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(32,96)],
		},
		Global.goal_dictionary: {
			Color.LIGHT_GRAY: Vector2(96,224), ## Back Button
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(480,160),
				Vector2(32,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(480,224),
				Vector2(32,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(480,288),
				Vector2(32,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	},
	Global.settings: {
		Global.flow_dictionary: {
			Color(0.96, 0.96, 0.96, 1): [Vector2(96,96)],
			Color(0.41, 0.41, 0.41, 1): [Vector2(224,96)],
			Color(0.23, 0.23, 0.23, 1): [Vector2(288,96)],
			Color(0.08, 0.08, 0.08, 1): [Vector2(416,96)]
		},
		Global.goal_dictionary: {
			Color(0.96, 0.96, 0.96, 1): Vector2(96,96), ## DEFAULT COLOR 1
			Color(0.75, 0.75, 0.75, 1): Vector2(160,96),
			Color(0.41, 0.41, 0.41, 1): Vector2(224,96), ## DEFAULT COLOR 2
			Color(0.23, 0.23, 0.23, 1): Vector2(288,96), ## DEFAULT COLOR 3
			Color(0.15, 0.15, 0.15, 1): Vector2(352,96),
			Color(0.08, 0.08, 0.08, 1): Vector2(416,96), ## DEFAULT COLOR 4
			
			## RED
			Color.DARK_RED: Vector2(96,160),
			Color.FIREBRICK: Vector2(160,160),
			Color.MAROON: Vector2(224,160),
			Color.CRIMSON: Vector2(288,160),
			Color.PALE_VIOLET_RED: Vector2(352,160),
			Color.PINK: Vector2(416,160),
			
			## YELLOW
			Color.SADDLE_BROWN: Vector2(96,224),
			Color.DARK_ORANGE: Vector2(160,224),
			Color.GOLDENROD: Vector2(224,224),
			Color.GOLD: Vector2(288,224),
			Color.TAN: Vector2(352,224),
			Color.PALE_GOLDENROD: Vector2(416,224),
			
			## GREEN
			Color.OLIVE_DRAB: Vector2(96,288),
			Color.MEDIUM_SEA_GREEN: Vector2(160,288),
			Color.MEDIUM_SPRING_GREEN: Vector2(224,288),
			Color.LAWN_GREEN: Vector2(288,288),
			Color.LIGHT_GREEN: Vector2(352,288),
			Color.PALE_GREEN: Vector2(416,288),
			
			## BLUE
			Color.DARK_CYAN: Vector2(96,352),
			Color.ROYAL_BLUE: Vector2(160,352),
			Color.CORNFLOWER_BLUE: Vector2(224,352),
			Color.DODGER_BLUE: Vector2(288,352),
			Color.MEDIUM_TURQUOISE: Vector2(352,352),
			Color.PALE_TURQUOISE: Vector2(416,352),
			
			# PURPLE
			Color.REBECCA_PURPLE: Vector2(96,416),
			Color.DARK_VIOLET: Vector2(160,416),
			Color.MEDIUM_PURPLE: Vector2(224,416),
			Color.ORCHID: Vector2(288,416),
			Color.PLUM: Vector2(352,416),
			Color.THISTLE: Vector2(416,416)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	}
}

var levels = {
	0: {},
	1: {
		Global.flow_dictionary: {
			1: [Vector2(416,288)],
			3: [Vector2(160,288)],
			4: [Vector2(96,416)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,288),
			3: Vector2(96,96),
			4: Vector2(416,416)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(224,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),Vector2(352,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(224,224),Vector2(352,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(224,288),Vector2(352,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	2: {
		Global.flow_dictionary: {
			1: [Vector2(160,160)],
			2: [Vector2(96,352)],
			3: [Vector2(352,160)],
			4: [Vector2(288,416)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,352),
			2: Vector2(288,288),
			3: Vector2(160,352),
			4: Vector2(288,96)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	3: {
		Global.flow_dictionary: {
			1: [Vector2(352,160)],
			2: [Vector2(224,96)],
			3: [Vector2(160,352)],
			4: [Vector2(352,288)]
		},
		Global.goal_dictionary: {
			1: Vector2(352,416),
			2: Vector2(224,224),
			3: Vector2(416,288),
			4: Vector2(416,416)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	4: {
		Global.flow_dictionary: {
			1: [Vector2(288,224)],
			2: [Vector2(224,224)],
			3: [Vector2(32,160)],
		},
		Global.goal_dictionary: {
			1: Vector2(96,352),
			2: Vector2(416,160),
			3: Vector2(224,416),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),
				Vector2(352,224),
				Vector2(352,288),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	5: {
		Global.flow_dictionary: {
			1: [Vector2(160,160)],
			2: [Vector2(352,160)],
			3: [Vector2(352,352)],
			4: [Vector2(160,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(96,352),
			2: Vector2(416,480),
			3: Vector2(352,96),
			4: Vector2(96,480)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),
				Vector2(160,96),
				Vector2(96,160),
				Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),
				Vector2(32,352),Vector2(32,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(352,416),
				Vector2(32,480),Vector2(352,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	6: {
		Global.flow_dictionary: {
			2: [Vector2(160,288)],
			3: [Vector2(416,288)],
			4: [Vector2(288,224)]
		},
		Global.goal_dictionary: {
			2: Vector2(416,224),
			3: Vector2(96,416),
			4: Vector2(96,352)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(224,288),Vector2(288,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(416,96),Vector2.LEFT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	7: {
		Global.flow_dictionary: {
			1: [Vector2(160,352)],
			2: [Vector2(352,416)],
			3: [Vector2(416,160)],
			4: [Vector2(96,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(480,32),
			2: Vector2(224,160),
			3: Vector2(480,96),
			4: Vector2(288,160)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(96,96),
				Vector2(32,160),Vector2(96,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(224,288),Vector2(416,288),Vector2(480,288),
				Vector2(416,352),Vector2(480,352),
				Vector2(96,416),Vector2(416,416),Vector2(480,416),
				Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(288,224),Vector2.LEFT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	8: {
		Global.flow_dictionary: {
			1: [Vector2(96,160)],
			3: [Vector2(96,288)]
		},
		Global.goal_dictionary: {
			1: Vector2(416,160),
			3: Vector2(416,288)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(160,160),Vector2.DOWN],[Vector2(224,160),Vector2.DOWN],[Vector2(288,160),Vector2.DOWN],[Vector2(352,160),Vector2.DOWN]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	9: {
		Global.flow_dictionary: {
			1: [Vector2(96,96)],
			2: [Vector2(416,96)],
			3: [Vector2(416,224)],
		},
		Global.goal_dictionary: {
			1: Vector2(224,224),
			2: Vector2(352,352),
			3: Vector2(96,416),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(288,96),Vector2(480,96),
				Vector2(32,160),Vector2(288,160),Vector2(480,160),
				Vector2(32,224),Vector2(288,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(224,96),Vector2.LEFT],[Vector2(96,224),Vector2.UP],[Vector2(416,160),Vector2.LEFT],[Vector2(224,416),Vector2.RIGHT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	10: {
		Global.flow_dictionary: {
			1: [Vector2(96,480)],
			2: [Vector2(96,96)],
			3: [Vector2(480,32)],
			4: [Vector2(288,416)]
		},
		Global.goal_dictionary: {
			1: Vector2(480,480),
			2: Vector2(96,416),
			3: Vector2(416,96),
			4: Vector2(288,32)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),
				Vector2(32,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(416,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),
				Vector2(32,480)
				],
			Global.ob_DIS: [[Vector2(352,160),Vector2.LEFT],[Vector2(224,224),Vector2.RIGHT],[Vector2(352,288),Vector2.LEFT],[Vector2(224,352),Vector2.RIGHT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	11: {
		Global.flow_dictionary: {
			1: [Vector2(160,32)],
			2: [Vector2(96,96)],
			3: [Vector2(352,288)],
			4: [Vector2(416,96)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,224),
			2: Vector2(224,288),
			3: Vector2(224,480),
			4: Vector2(96,416)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(160,96),
				Vector2(160,160),
				Vector2(96,224),
				Vector2(96,288),Vector2(480,288),
				Vector2(224,352),Vector2(352,352),Vector2(480,352),
				Vector2(480,416),
				Vector2(416,480),Vector2(480,480)
				],
			Global.ob_DIS: [[Vector2(288,32),Vector2.DOWN]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	12: {
		Global.flow_dictionary: {
			1: [Vector2(96,224)],
			4: [Vector2(96,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,416),
			4: Vector2(160,416)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(224,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(160,96),Vector2.RIGHT],[Vector2(416,352),Vector2.UP]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	13: {
		Global.flow_dictionary: {
			1: [Vector2(160,32)],
			2: [Vector2(224,32)],
			3: [Vector2(288,32)],
			4: [Vector2(352,32)]
		},
		Global.goal_dictionary: {
			1: Vector2(352,352),
			2: Vector2(416,352),
			3: Vector2(160,352),
			4: Vector2(480,224)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(416,160),Vector2(480,160),
				],
			Global.ob_DIS: [[Vector2(32,416),Vector2.UP],[Vector2(96,480),Vector2.RIGHT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	14: {
		Global.flow_dictionary: {
			1: [Vector2(224,96)],
			2: [Vector2(96,224)],
			3: [Vector2(352,224)],
			4: [Vector2(160,288)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,416),
			2: Vector2(160,96),
			3: Vector2(32,352),
			4: Vector2(416,96)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(96,96),
				Vector2(224,352),
				Vector2(416,416),Vector2(480,416),
				Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(160,352),Vector2.DOWN],[Vector2(288,352),Vector2.RIGHT]],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
	15: {
		Global.flow_dictionary: {
			1: [Vector2(96,416)],
			2: [Vector2(288,352)],
			3: [Vector2(352,352)],
			4: [Vector2(416,96)]
		},
		Global.goal_dictionary: {
			2: Vector2(480,96),
			3: Vector2(480,416),
			4: Vector2(416,288)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),
				Vector2(32,160),Vector2(160,160),
				Vector2(32,224),Vector2(160,224),
				Vector2(32,288),Vector2(160,288),
				Vector2(32,352),Vector2(160,352),
				Vector2(32,416),Vector2(160,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [[Vector2(96,160),Vector2.DOWN]],
			Global.ob_DEV: []
		}
	},
	16: {
		Global.flow_dictionary: {
			1: [Vector2(288,32)],
			4: [Vector2(96,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(480,160),
			4: Vector2(96,96)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),
				Vector2(32,96),Vector2(224,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),
				Vector2(32,224),Vector2(96,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(416,288),Vector2(480,288),
				Vector2(224,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(416,416),Vector2.LEFT]],
			Global.ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(288,96),Vector2.RIGHT],[Vector2(288,352),Vector2.RIGHT]],
			Global.ob_DEV: []
		}
	},
	17: {
		Global.flow_dictionary: {
			1: [Vector2(96,160)],
			2: [Vector2(96,224)],
			3: [Vector2(96,288)],
			4: [Vector2(96,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(416,160),
			2: Vector2(416,352),
			3: Vector2(416,224),
			4: Vector2(416,288)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(224,288),Vector2(288,288),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [[Vector2(160,416),Vector2.UP]],
			Global.ob_DEV: []
		}
	},
	18: {
		Global.flow_dictionary: {
			3: [Vector2(96,288)]
		},
		Global.goal_dictionary: {
			3: Vector2(416,288)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(224,160),Vector2.DOWN],[Vector2(288,160),Vector2.DOWN],[Vector2(352,160),Vector2.DOWN]],
			Global.ob_DEV: []
		}
	},
	19: {
		Global.flow_dictionary: {
			1: [Vector2(352,32)],
			2: [Vector2(32,160)],
			3: [Vector2(160,480)],
			4: [Vector2(480,352)]
		},
		Global.goal_dictionary: {
			1: Vector2(224,288),
			2: Vector2(288,288),
			3: Vector2(288,224),
			4: Vector2(224,224)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,416),Vector2(96,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(352,160),Vector2.LEFT],[Vector2(352,352),Vector2.UP],[Vector2(160,352),Vector2.RIGHT]],
			Global.ob_DEV: []
		}
	},
	20: {
		Global.flow_dictionary: {
			1: [Vector2(96,480)],
			2: [Vector2(416,480)],
			3: [Vector2(160,96)],
			4: [Vector2(160,288)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,352),
			2: Vector2(480,480),
			3: Vector2(160,224),
			4: Vector2(160,160)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(352,32),Vector2(416,32),
				Vector2(32,96),Vector2(352,96),Vector2(416,96),
				Vector2(32,160),Vector2(352,160),Vector2(416,160),
				Vector2(32,224),Vector2(352,224),Vector2(416,224),
				Vector2(32,288),Vector2(352,288),Vector2(416,288),
				Vector2(32,352),Vector2(352,352),Vector2(416,352),
				Vector2(32,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),
				Vector2(32,480),Vector2(352,480),
				],
			Global.ob_DIS: [[Vector2(96,32),Vector2.UP],[Vector2(288,224),Vector2.LEFT]],
			Global.ob_DIV: [[Vector2(288,480),Vector2.LEFT],[Vector2(480,416),Vector2.UP]],
			Global.ob_DEV: []
		}
	},
	21: {
		Global.flow_dictionary: {
			1: [Vector2(160,416)],
			2: [Vector2(352,96)],
			3: [Vector2(160,96)],
			4: [Vector2(288,288)]
		},
		Global.goal_dictionary: {
			1: Vector2(288,224),
			2: Vector2(224,416),
			3: Vector2(352,416),
			4: Vector2(288,32)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(480,480)
				],
			Global.ob_DIS: [[Vector2(224,352),Vector2.RIGHT]],
			Global.ob_DIV: [[Vector2(224,288),Vector2.RIGHT]],
			Global.ob_DEV: []
		}
	},
	22: {
		Global.flow_dictionary: {
			3: [Vector2(96,96)],
		},
		Global.goal_dictionary: {
			3: Vector2(416,416),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [[Vector2(416,160),Vector2.LEFT],[Vector2(416,224),Vector2.LEFT],[Vector2(416,288),Vector2.LEFT],[Vector2(416,352),Vector2.LEFT]],
			Global.ob_DEV: []
		}
	},
	23: {
		Global.flow_dictionary: {
			1: [Vector2(160,160)],
			2: [Vector2(416,416)],
			3: [Vector2(224,416)],
			4: [Vector2(352,416)]
		},
		Global.goal_dictionary: {
			1: Vector2(416,160),
			2: Vector2(160,224),
			3: Vector2(416,96),
			4: Vector2(224,352)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(288,224),Vector2(352,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(160,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(416,224),Vector2.DOWN]],
			Global.ob_DIV: [[Vector2(224,224),Vector2.UP],[Vector2(288,416),Vector2.LEFT]],
			Global.ob_DEV: []
		}
	},
	24: {
		Global.flow_dictionary: {
			1: [Vector2(160,288)],
			3: [Vector2(352,480)],
			2: [Vector2(480,32)],
			4: [Vector2(288,416)]
		},
		Global.goal_dictionary: {
			1: Vector2(416,288),
			3: Vector2(416,224),
			2: Vector2(416,480),
			4: Vector2(96,96)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),
				Vector2(96,160),
				Vector2(416,416),
				Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480)
				],
			Global.ob_DIS: [[Vector2(32,160),Vector2.DOWN],[Vector2(288,352),Vector2.RIGHT]],
			Global.ob_DIV: [[Vector2(480,416),Vector2.UP]],
			Global.ob_DEV: []
		}
	},
	25: {
		Global.flow_dictionary: {
			1: [Vector2(96,288)],
		},
		Global.goal_dictionary: {
			1: Vector2(416,288),
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(224,96),Vector2(288,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),Vector2(288,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [[Vector2(160,96),Vector2.DOWN]],
			Global.ob_DIV: [[Vector2(352,96),Vector2.DOWN]],
			Global.ob_DEV: []
		}
	},
	
	## TEMPLATE LEVEL
	99: {
		Global.flow_dictionary: {
			1: [Vector2(0,0)],
			2: [Vector2(0,0)],
			3: [Vector2(0,0)],
			4: [Vector2(0,0)]
		},
		Global.goal_dictionary: {
			1: Vector2(0,0),
			2: Vector2(0,0),
			3: Vector2(0,0),
			4: Vector2(0,0)
		},
		Global.obstacle_dictionary: {
			Global.ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(416,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			Global.ob_DIS: [],
			Global.ob_DIV: [],
			Global.ob_DEV: []
		}
	},
}
