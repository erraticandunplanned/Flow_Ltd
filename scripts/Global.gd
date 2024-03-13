extends Node

const MAPSIZE = 512

var current_level = 0
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

var node_color_1 = Color.WHITE_SMOKE
var node_color_2 = Color.DARK_GRAY
var node_color_3 = Color.SLATE_GRAY
var node_color_4 = Color.DIM_GRAY

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
