extends Node

const MAPSIZE = 512
const dev_unlock = 0

var current_level = 0
var menu = main_menu
var completion = [
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
	false
]
var move_counter = [
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0
]
var total_resets = 0

var node_color_1 = Color(0.96, 0.96, 0.96, 1) # White Smoke
var node_color_2 = Color(0.41, 0.41, 0.41, 1) # Dim Gray
var node_color_3 = Color(0.23, 0.23, 0.23, 1)
var node_color_4 = Color(0.08, 0.08, 0.08, 1)

enum {
	main_menu,
	level_select,
	about
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


func unlock(unlock_to : int):
	for i in completion.size():
		if i < unlock_to: completion[i] = true
