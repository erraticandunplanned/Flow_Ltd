extends Node

const MAPSIZE = 512

var current_level = 0
var completion = {
	0: true,
	1: false,
	2: false
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

var levels = {
	0: {
		flow_dictionary: {
			Color.WHITE_SMOKE: [Vector2(96,288)],
			Color.LIGHT_CORAL: [Vector2(96,224)],
			Color.MEDIUM_AQUAMARINE: [Vector2(480,32)],
			Color.LIGHT_GREEN: [Vector2(288,416)]
		},
		goal_dictionary: {
			Color.WHITE_SMOKE: Vector2(416,288),
			Color.LIGHT_CORAL: Vector2(416,224),
			Color.MEDIUM_AQUAMARINE: Vector2(480,480),
			Color.LIGHT_GREEN: Vector2(96,96)
		},
		obstacle_dictionary: {
			ob_grid: [Vector2(32,32),Vector2(96,32)],
			ob_DIS: [Vector2(32,416)],
			ob_DIV: [Vector2(32,96)],
			ob_DEV: []
		}
	}
}
