extends Node2D

@onready var gridtile = preload("res://scenes/gridtile.tscn")
@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var obstaclecontainer = $obstacle_container
@onready var canvas = $draw_canvas
@onready var clock = $CanvasLayer/Control/TextEdit
@onready var cursor_snap = $cursor_snap
@onready var cursor_clock = $cursor_clock

@onready var DIS = preload("res://scenes/DIS_obstacle.tscn")
@onready var DIV = preload("res://scenes/DIV_obstacle.tscn")
@onready var DEV = preload("res://scenes/DEV_obstacle.tscn")

const MAPSIZE = Vector2(512,512)

var time = 0
var current_flow_node : Node
var current_flow_color : Color
var success = false

signal clock_update(time)

var flow_dict = {
	Color.WHITE_SMOKE: [Vector2(96,288)],
	Color.LIGHT_CORAL: [Vector2(96,224)],
	Color.MEDIUM_AQUAMARINE: [Vector2(480,32)],
	Color.LIGHT_GREEN: [Vector2(288,416)]
}
var goal_dict = {
	Color.WHITE_SMOKE: Vector2(416,288),
	Color.LIGHT_CORAL: Vector2(416,224),
	Color.MEDIUM_AQUAMARINE: Vector2(480,480),
	Color.LIGHT_GREEN: Vector2(96,96)
}
var obstacle_dict = {
	0: [Vector2(32,416)],
	1: [Vector2(32,96)],
	2: []
}

func _ready():
	## PLACE MAP TILES
	for i in range(0,8):
		for j in range(0,8):
			var newtile = gridtile.instantiate()
			newtile.name = str(i) + "," + str(j)
			newtile.global_position = Vector2(i * 64 + 32, j * 64 + 32)
	
	## PLACE OBSTACLES
	for i in obstacle_dict.get(0):
		var new_DIS = DIS.instantiate()
		obstaclecontainer.add_child(new_DIS)
		new_DIS.global_position = i
		new_DIS.name = "DIS"
	for i in obstacle_dict.get(1):
		var new_DIV = DIV.instantiate()
		obstaclecontainer.add_child(new_DIV)
		new_DIV.name = "DIV"
		new_DIV.global_position = i
	for i in obstacle_dict.get(2):
		var new_DEV = DEV.instantiate()
		obstaclecontainer.add_child(new_DEV)
		new_DEV.name = "DEV"
		new_DEV.global_position = i
	
	## PLACE INITIAL "FLOW DOTS" ONTO GRID BASED ON "flow_dict" DICTIONARY
	for f in flow_dict.keys():
		var new_flow = Node2D.new()
		flowcontainer.add_child(new_flow)
		new_flow.name = str(f)
		var pos = flow_dict.get(f)
		new_flow.global_position = pos[0]
	canvas.update_flow(flow_dict)
	
	## DRAW GOALS IN MAP
	canvas.update_goals(goal_dict)

func _process(delta):
	if success: return
	
	## ON MOUSE CLICK, SET NEAREST FLOW NODE TO CURRENT
	if Input.is_action_just_pressed("left_mouse_click"):
		for i in flowcontainer.get_children():
			if get_global_mouse_position().distance_to(i.global_position) < 32:
				current_flow_node = i
				for j in flow_dict.keys():
					var key = flow_dict[j]
					if key.back() == i.global_position:
						current_flow_color = j
	
	## ON MOUSE RELEASE, SET CURRENT FLOW NODE TO NULL
	if Input.is_action_just_released("left_mouse_click"):
		current_flow_node = null
		current_flow_color = Color.WHITE
	
	## SET "CURSOR_SNAP" TO THE NEAREST GRID LOCATION OF MOUSE
	var mousepos = get_global_mouse_position()
	cursor_snap.global_position = Vector2(clamp(floor(mousepos.x / 64) * 64 + 32, 32, MAPSIZE.x - 32), clamp(floor(mousepos.y / 64) * 64 + 32, 32, MAPSIZE.y - 32))
	
	## MOST OF THIS FUNCTION ONLY CALLS IF THE MOUSE IS HOLDING A FLOW CIRCLE
	if current_flow_node != null:
		
		## SET "CURSOR_CLOCK" TO ONLY VALID TILES
		var is_valid = true
		
		## GOING BACKWARDS 1 TILE IS A VALID TILE
		if flow_dict.get(current_flow_color).has(cursor_snap.global_position): 
			var reverse_flow : Array
			reverse_flow.append_array(flow_dict.get(current_flow_color))
			reverse_flow.reverse()
			if reverse_flow.size() > 1:
				if reverse_flow[1] == cursor_snap.global_position:
					flow_dict.get(current_flow_color).remove_at(flow_dict.get(current_flow_color).size()-1)
					is_valid = true
				else: is_valid = false
			else:
				is_valid = false
		
		## ENTERING ANOTHER FLOW LINE IS NOT A VALID TILE
		else:
			for k in flow_dict.keys():
				var array = flow_dict.get(k)
				for i in array:
					if cursor_snap.global_position == i: is_valid = false
		
		## ENTERING AN "OBSTACLE" IS NOT A VALID TILE
		for i in obstaclecontainer.get_children():
			if i.global_position == cursor_snap.global_position: is_valid = false
		
		if is_valid: cursor_clock.global_position = cursor_snap.global_position
		
		## ENSURE FLOW NODE ONLY MOVES ORTHOGONALLY A SINGLE TILE
		if is_valid and abs(current_flow_node.global_position.x - cursor_clock.global_position.x) + abs(current_flow_node.global_position.y - cursor_clock.global_position.y) == 64:
			
			## UPDATE FLOW POSITION AND DRAW LINES
			current_flow_node.global_position = cursor_clock.global_position
			flow_dict.get(current_flow_color).append(current_flow_node.global_position)
			canvas.update_flow(flow_dict)
			
			## ADVANCE CLOCK
			time += 1
			var text = str(time)
			clock.text = text
			emit_signal("clock_update", time)
	
	## CHECK FOR WIN CONDITION
	if not goal_dict.keys().is_empty(): success = true
	for g in goal_dict.keys():
		if flow_dict.has(g):
			var array = flow_dict.get(g)
			var last_pos = array.back()
			if goal_dict.get(g) != last_pos: success = false
		else: success = false
	
	queue_redraw()
	if success == true:
		print("Win!")

## DRAW GRID LINES
func _draw():
	var step = 0
	for i in range(0,8):
		draw_line(Vector2(0,step),Vector2(512,step),Color.WHITE,-1,false)
		draw_line(Vector2(step,0),Vector2(step,512),Color.WHITE,-1,false)
		step += 64
