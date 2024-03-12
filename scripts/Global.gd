extends Node

const MAPSIZE = 512

var current_level = 22
var menu = main_menu
var completion = [
	true,
	true,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false
]

var dev_reset_num = 0

enum {
	main_menu,
	level_select,
	settings
}

enum {
	flow_dictionary,
	goal_dictionary,
	obstacle_dictionary
}

enum {
	ob_grid,
	ob_DIS,
	ob_DIV,
	ob_DEV
}

var menu_levels = {
	main_menu: {
		flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(288,288)]
		},
		goal_dictionary: {
			Color(0.827451, 0.827451, 0.827450, 1): Vector2(416,288),
			Color(0.827451, 0.827450, 0.827451, 1): Vector2(288,416),
			Color(0.827450, 0.827451, 0.827451, 1): Vector2(416,224),
			Color(0.827451, 0.827451, 0.827451, 1): Vector2(160,288),
		},
		obstacle_dictionary: {
			ob_grid: [
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
	level_select: {
		flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(32,96)]
		},
		goal_dictionary: {
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
			Color(0.827426, 0.827426, 0.827426, 1): Vector2(96,352),
			Color(0.827425, 0.827425, 0.827425, 1): Vector2(160,352),
			Color(0.827424, 0.827424, 0.827424, 1): Vector2(224,352),
			Color(0.827423, 0.827423, 0.827423, 1): Vector2(288,352),
			Color(0.827422, 0.827422, 0.827422, 1): Vector2(352,352),
			Color(0.827421, 0.827421, 0.827421, 1): Vector2(416,352),
			Color(0.827420, 0.827420, 0.827420, 1): Vector2(96,416),
			Color(0.827419, 0.827419, 0.827419, 1): Vector2(160,416),
			Color(0.827418, 0.827418, 0.827418, 1): Vector2(224,416),
			Color(0.827417, 0.827417, 0.827417, 1): Vector2(288,416),
			Color(0.827416, 0.827416, 0.827416, 1): Vector2(352,416),
			Color(0.827415, 0.827415, 0.827415, 1): Vector2(416,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(480,96),
				Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	},
	settings: {
		flow_dictionary: {
			Color.LIGHT_GRAY: [Vector2(32,96)]
		},
		goal_dictionary: {},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
		}
	},
}

var levels = {
	0: {},
	1: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(416,288)],
			Color.SLATE_GRAY: [Vector2(160,288)],
			Color.DIM_GRAY: [Vector2(96,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,288),
			Color.SLATE_GRAY: Vector2(96,96),
			Color.DIM_GRAY: Vector2(416,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(224,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),Vector2(352,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(224,224),Vector2(352,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(224,288),Vector2(352,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	2: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,160)],
			Color.DARK_GRAY: [Vector2(96,352)],
			Color.SLATE_GRAY: [Vector2(352,160)],
			Color.DIM_GRAY: [Vector2(288,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,352),
			Color.DARK_GRAY: Vector2(288,288),
			Color.SLATE_GRAY: Vector2(160,352),
			Color.DIM_GRAY: Vector2(288,96)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	3: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(352,160)],
			Color.DARK_GRAY: [Vector2(224,96)],
			Color.SLATE_GRAY: [Vector2(160,352)],
			Color.DIM_GRAY: [Vector2(352,288)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(352,416),
			Color.DARK_GRAY: Vector2(224,224),
			Color.SLATE_GRAY: Vector2(416,288),
			Color.DIM_GRAY: Vector2(416,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	4: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(288,224)],
			Color.DARK_GRAY: [Vector2(224,224)],
			Color.SLATE_GRAY: [Vector2(352,288)],
			Color.DIM_GRAY: [Vector2(32,160)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(96,352),
			Color.DARK_GRAY: Vector2(416,160),
			Color.SLATE_GRAY: Vector2(96,160),
			Color.DIM_GRAY: Vector2(224,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	5: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,160)],
			Color.DARK_GRAY: [Vector2(352,160)],
			Color.SLATE_GRAY: [Vector2(352,352)],
			Color.DIM_GRAY: [Vector2(160,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(96,352),
			Color.DARK_GRAY: Vector2(416,480),
			Color.SLATE_GRAY: Vector2(352,96),
			Color.DIM_GRAY: Vector2(96,480)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),
				Vector2(160,96),
				Vector2(96,160),
				Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),
				Vector2(32,352),Vector2(32,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(352,416),
				Vector2(32,480),Vector2(352,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	6: {
		flow_dictionary: {
			Color.DARK_GRAY: [Vector2(160,288)],
			Color.SLATE_GRAY: [Vector2(416,288)],
			Color.DIM_GRAY: [Vector2(288,224)]
		},
		goal_dictionary: {
			Color.DARK_GRAY: Vector2(416,224),
			Color.SLATE_GRAY: Vector2(96,416),
			Color.DIM_GRAY: Vector2(96,352)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(224,288),Vector2(288,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(416,96),Vector2.LEFT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	7: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,352)],
			Color.DARK_GRAY: [Vector2(352,416)],
			Color.SLATE_GRAY: [Vector2(416,160)],
			Color.DIM_GRAY: [Vector2(96,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(480,32),
			Color.DARK_GRAY: Vector2(224,160),
			Color.SLATE_GRAY: Vector2(480,96),
			Color.DIM_GRAY: Vector2(288,160)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(96,96),
				Vector2(32,160),Vector2(96,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(224,288),Vector2(416,288),Vector2(480,288),
				Vector2(416,352),Vector2(480,352),
				Vector2(96,416),Vector2(416,416),Vector2(480,416),
				Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(288,224),Vector2.LEFT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	8: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,160)],
			Color.SLATE_GRAY: [Vector2(96,288)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,160),
			Color.SLATE_GRAY: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(160,160),Vector2.DOWN],[Vector2(224,160),Vector2.DOWN],[Vector2(288,160),Vector2.DOWN],[Vector2(352,160),Vector2.DOWN]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	9: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,96)],
			Color.DARK_GRAY: [Vector2(416,96)],
			Color.SLATE_GRAY: [Vector2(416,224)],
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(224,224),
			Color.DARK_GRAY: Vector2(352,352),
			Color.SLATE_GRAY: Vector2(96,416),
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(288,96),Vector2(480,96),
				Vector2(32,160),Vector2(288,160),Vector2(480,160),
				Vector2(32,224),Vector2(288,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(224,96),Vector2.LEFT],[Vector2(96,224),Vector2.UP],[Vector2(416,160),Vector2.LEFT],[Vector2(224,416),Vector2.RIGHT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	10: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,480)],
			Color.DARK_GRAY: [Vector2(96,96)],
			Color.SLATE_GRAY: [Vector2(480,32)],
			Color.DIM_GRAY: [Vector2(288,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(480,480),
			Color.DARK_GRAY: Vector2(96,416),
			Color.SLATE_GRAY: Vector2(416,96),
			Color.DIM_GRAY: Vector2(288,32)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),
				Vector2(32,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(416,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),
				Vector2(32,480)
				],
			ob_DIS: [[Vector2(352,160),Vector2.LEFT],[Vector2(224,224),Vector2.RIGHT],[Vector2(352,288),Vector2.LEFT],[Vector2(224,352),Vector2.RIGHT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	11: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,32)],
			Color.DARK_GRAY: [Vector2(96,96)],
			Color.SLATE_GRAY: [Vector2(352,288)],
			Color.DIM_GRAY: [Vector2(416,96)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(224,224),
			Color.DARK_GRAY: Vector2(224,288),
			Color.SLATE_GRAY: Vector2(224,480),
			Color.DIM_GRAY: Vector2(96,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(160,96),
				Vector2(96,224),
				Vector2(96,288),Vector2(480,288),
				Vector2(224,352),Vector2(352,352),Vector2(480,352),
				Vector2(480,416),
				Vector2(416,480),Vector2(480,480)
				],
			ob_DIS: [[Vector2(288,32),Vector2.DOWN]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	12: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,224)],
			Color.DIM_GRAY: [Vector2(96,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,416),
			Color.DIM_GRAY: Vector2(160,416)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(224,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(160,96),Vector2.RIGHT],[Vector2(416,352),Vector2.UP]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	13: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,32)],
			Color.DARK_GRAY: [Vector2(224,32)],
			Color.SLATE_GRAY: [Vector2(288,32)],
			Color.DIM_GRAY: [Vector2(352,32)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(352,352),
			Color.DARK_GRAY: Vector2(416,352),
			Color.SLATE_GRAY: Vector2(160,352),
			Color.DIM_GRAY: Vector2(480,224)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(416,160),Vector2(480,160),
				],
			ob_DIS: [[Vector2(32,416),Vector2.UP],[Vector2(96,480),Vector2.RIGHT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	14: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(224,96)],
			Color.DARK_GRAY: [Vector2(96,224)],
			Color.SLATE_GRAY: [Vector2(352,224)],
			Color.DIM_GRAY: [Vector2(160,288)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,416),
			Color.DARK_GRAY: Vector2(160,96),
			Color.SLATE_GRAY: Vector2(32,352),
			Color.DIM_GRAY: Vector2(416,96)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(32,96),Vector2(96,96),
				Vector2(224,352),
				Vector2(416,416),Vector2(480,416),
				Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(160,352),Vector2.DOWN],[Vector2(288,352),Vector2.RIGHT]],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	15: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,416)],
			Color.DARK_GRAY: [Vector2(288,224)],
			Color.SLATE_GRAY: [Vector2(352,288)],
			Color.DIM_GRAY: [Vector2(224,96)]
		},
		goal_dictionary: {
			Color.DARK_GRAY: Vector2(480,96),
			Color.SLATE_GRAY: Vector2(480,416),
			Color.DIM_GRAY: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),
				Vector2(32,160),Vector2(160,160),
				Vector2(32,224),Vector2(160,224),
				Vector2(32,288),Vector2(160,288),
				Vector2(32,352),Vector2(160,352),
				Vector2(32,416),Vector2(160,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [[Vector2(96,160),Vector2.DOWN]],
			ob_DEV: []
		}
	},
	16: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(288,32)],
			Color.DIM_GRAY: [Vector2(96,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(480,160),
			Color.DIM_GRAY: Vector2(96,96)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),
				Vector2(32,96),Vector2(224,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),
				Vector2(32,224),Vector2(96,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(416,288),Vector2(480,288),
				Vector2(224,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(416,416),Vector2.LEFT]],
			ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(288,96),Vector2.RIGHT],[Vector2(288,352),Vector2.RIGHT]],
			ob_DEV: []
		}
	},
	17: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,160)],
			Color.DARK_GRAY: [Vector2(96,224)],
			Color.SLATE_GRAY: [Vector2(96,288)],
			Color.DIM_GRAY: [Vector2(96,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,160),
			Color.DARK_GRAY: Vector2(416,352),
			Color.SLATE_GRAY: Vector2(416,224),
			Color.DIM_GRAY: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(224,288),Vector2(288,288),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [[Vector2(160,416),Vector2.UP]],
			ob_DEV: []
		}
	},
	18: {
		flow_dictionary: {
			Color.SLATE_GRAY: [Vector2(96,288)]
		},
		goal_dictionary: {
			Color.SLATE_GRAY: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(224,160),Vector2.DOWN],[Vector2(288,160),Vector2.DOWN],[Vector2(352,160),Vector2.DOWN]],
			ob_DEV: []
		}
	},
	19: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(352,32)],
			Color.DARK_GRAY: [Vector2(32,160)],
			Color.SLATE_GRAY: [Vector2(160,480)],
			Color.DIM_GRAY: [Vector2(480,352)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(224,288),
			Color.DARK_GRAY: Vector2(288,288),
			Color.SLATE_GRAY: Vector2(288,224),
			Color.DIM_GRAY: Vector2(224,224)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,416),Vector2(96,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [[Vector2(160,160),Vector2.DOWN],[Vector2(352,160),Vector2.LEFT],[Vector2(352,352),Vector2.UP],[Vector2(160,352),Vector2.RIGHT]],
			ob_DEV: []
		}
	},
	20: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,480)],
			Color.DARK_GRAY: [Vector2(416,480)],
			Color.SLATE_GRAY: [Vector2(160,96)],
			Color.DIM_GRAY: [Vector2(160,288)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,352),
			Color.DARK_GRAY: Vector2(480,480),
			Color.SLATE_GRAY: Vector2(160,224),
			Color.DIM_GRAY: Vector2(160,160)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(352,32),Vector2(416,32),
				Vector2(32,96),Vector2(352,96),Vector2(416,96),
				Vector2(32,160),Vector2(352,160),Vector2(416,160),
				Vector2(32,224),Vector2(352,224),Vector2(416,224),
				Vector2(32,288),Vector2(352,288),Vector2(416,288),
				Vector2(32,352),Vector2(352,352),Vector2(416,352),
				Vector2(32,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),
				Vector2(32,480),Vector2(352,480),
				],
			ob_DIS: [[Vector2(96,32),Vector2.UP],[Vector2(288,224),Vector2.LEFT]],
			ob_DIV: [[Vector2(288,480),Vector2.LEFT],[Vector2(480,416),Vector2.UP]],
			ob_DEV: []
		}
	},
	21: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,416)],
			Color.DARK_GRAY: [Vector2(352,96)],
			Color.SLATE_GRAY: [Vector2(160,96)],
			Color.DIM_GRAY: [Vector2(288,288)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(288,224),
			Color.DARK_GRAY: Vector2(224,416),
			Color.SLATE_GRAY: Vector2(352,416),
			Color.DIM_GRAY: Vector2(288,32)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(480,480)
				],
			ob_DIS: [[Vector2(224,352),Vector2.RIGHT]],
			ob_DIV: [[Vector2(224,288),Vector2.RIGHT]],
			ob_DEV: []
		}
	},
	22: {
		flow_dictionary: {
			Color.SLATE_GRAY: [Vector2(96,96)],
		},
		goal_dictionary: {
			Color.SLATE_GRAY: Vector2(416,416),
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [[Vector2(416,160),Vector2.LEFT],[Vector2(416,224),Vector2.LEFT],[Vector2(416,288),Vector2.LEFT],[Vector2(416,352),Vector2.LEFT]],
			ob_DEV: []
		}
	},
	
	33: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,160)],
			Color.DARK_GRAY: [Vector2(416,416)],
			Color.SLATE_GRAY: [Vector2(224,416)],
			Color.DIM_GRAY: [Vector2(352,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,160),
			Color.DARK_GRAY: Vector2(160,224),
			Color.SLATE_GRAY: Vector2(416,96),
			Color.DIM_GRAY: Vector2(224,352)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(480,96),
				Vector2(32,160),Vector2(480,160),
				Vector2(32,224),Vector2(288,224),Vector2(352,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(160,352),Vector2(480,352),
				Vector2(32,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(416,224),Vector2.DOWN]],
			ob_DIV: [[Vector2(224,224),Vector2.UP],[Vector2(288,416),Vector2.LEFT]],
			ob_DEV: []
		}
	},
	34: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(160,288)],
			Color.LIGHT_GRAY: [Vector2(352,480)],
			Color.DARK_GRAY: [Vector2(480,32)],
			Color.DIM_GRAY: [Vector2(288,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,288),
			Color.LIGHT_GRAY: Vector2(416,224),
			Color.DARK_GRAY: Vector2(416,480),
			Color.DIM_GRAY: Vector2(96,96)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),
				Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),
				Vector2(96,160),
				Vector2(416,416),
				Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480)
				],
			ob_DIS: [[Vector2(32,160),Vector2.DOWN],[Vector2(288,352),Vector2.RIGHT]],
			ob_DIV: [[Vector2(480,416),Vector2.UP]],
			ob_DEV: []
		}
	},
	
	36: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,288)],
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,288),
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(224,96),Vector2(288,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(224,160),Vector2(288,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(480,288),
				Vector2(32,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [[Vector2(160,96),Vector2.DOWN]],
			ob_DIV: [[Vector2(352,96),Vector2.DOWN]],
			ob_DEV: []
		}
	},
	
	## TEMPLATE LEVEL
	99: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(0,0)],
			Color.DARK_GRAY: [Vector2(0,0)],
			Color.SLATE_GRAY: [Vector2(0,0)],
			Color.DIM_GRAY: [Vector2(0,0)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(0,0),
			Color.DARK_GRAY: Vector2(0,0),
			Color.SLATE_GRAY: Vector2(0,0),
			Color.DIM_GRAY: Vector2(0,0)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(96,288),Vector2(160,288),Vector2(224,288),Vector2(288,288),Vector2(352,288),Vector2(416,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
}
