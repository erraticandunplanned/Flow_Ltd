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
			Color.LIGHT_CORAL: [Vector2(96,288)]
		},
		goal_dictionary: {
			Color.LIGHT_CORAL: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(224,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(224,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	1: {
		flow_dictionary: {
			Color.LIGHT_CORAL: [Vector2(96,288)]
		},
		goal_dictionary: {
			Color.LIGHT_CORAL: Vector2(416,288)
		},
		obstacle_dictionary: {
			ob_grid: [
				Vector2(32,32),Vector2(96,32),Vector2(160,32),Vector2(224,32),Vector2(288,32),Vector2(352,32),Vector2(416,32),Vector2(480,32),
				Vector2(32,96),Vector2(96,96),Vector2(160,96),Vector2(224,96),Vector2(288,96),Vector2(352,96),Vector2(416,96),Vector2(480,96),
				Vector2(32,160),Vector2(96,160),Vector2(160,160),Vector2(224,160),Vector2(288,160),Vector2(352,160),Vector2(416,160),Vector2(480,160),
				Vector2(32,224),Vector2(96,224),Vector2(160,224),Vector2(288,224),Vector2(352,224),Vector2(416,224),Vector2(480,224),
				Vector2(32,288),Vector2(480,288),
				Vector2(32,352),Vector2(96,352),Vector2(160,352),Vector2(288,352),Vector2(352,352),Vector2(416,352),Vector2(480,352),
				Vector2(32,416),Vector2(96,416),Vector2(160,416),Vector2(224,416),Vector2(288,416),Vector2(352,416),Vector2(416,416),Vector2(480,416),
				Vector2(32,480),Vector2(96,480),Vector2(160,480),Vector2(224,480),Vector2(288,480),Vector2(352,480),Vector2(416,480),Vector2(480,480),
				],
			ob_DIS: [Vector2(224,352)],
			ob_DIV: [],
			ob_DEV: []
		}
	},
	2: {
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
			ob_grid: [Vector2(96,32)],
			ob_DIS: [Vector2(32,416)],
			ob_DIV: [Vector2(32,96)],
			ob_DEV: []
		}
	}
}
