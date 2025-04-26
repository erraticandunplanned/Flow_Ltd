extends Node2D

@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var obstaclecontainer = $obstacle_container
@onready var canvas = $draw_canvas
@onready var clock_text = $CanvasLayer/Control/CenterContainer/vert/Clock
@onready var reset_text = $CanvasLayer/Control/CenterContainer/vert/reset_text
@onready var cursor_snap = $cursor_snap
@onready var cursor_clock = $cursor_clock

@onready var thankyou = $"CanvasLayer/thank you for playing"

@onready var gridtile = preload("res://scenes/gridtile.tscn")
@onready var DIS = preload("res://scenes/DIS_obstacle.tscn")
@onready var DIV = preload("res://scenes/DIV_obstacle.tscn")
@onready var DEV = preload("res://scenes/DEV_obstacle.tscn")

@onready var collision_image = preload("res://scenes/collision.tscn")

var time = 0
var current_flow_node : Node
var current_flow_color : Color
var success = false

signal clock_update(time)

var flow_dict = Levels.levels.get(Global.current_level).get(Global.flow_dictionary).duplicate(true)
var goal_dict = Levels.levels.get(Global.current_level).get(Global.goal_dictionary).duplicate(true)
var obstacle_dict = Levels.levels.get(Global.current_level).get(Global.obstacle_dictionary).duplicate(true)

func _ready():
	## UPDATE CLOCK
	var text = str(Global.current_level) + " | " + str(time)
	clock_text.text = text
	
	## PLACE OBSTACLES
	for i in obstacle_dict.get(0):
		var new_grid = gridtile.instantiate()
		obstaclecontainer.add_child(new_grid)
		new_grid.global_position = i
		new_grid.name = str(new_grid.global_position)
	for i in obstacle_dict.get(1):
		var new_DIS = DIS.instantiate()
		obstaclecontainer.add_child(new_DIS)
		new_DIS.global_position = i[0]
		new_DIS.rotation_setup(i[1])
		new_DIS.name = "DIS"
	for i in obstacle_dict.get(2):
		var new_DIV = DIV.instantiate()
		obstaclecontainer.add_child(new_DIV)
		new_DIV.global_position = i[0]
		new_DIV.rotation_setup(i[1])
		new_DIV.name = "DIV"
	for i in obstacle_dict.get(3):
		var new_DEV = DEV.instantiate()
		obstaclecontainer.add_child(new_DEV)
		new_DEV.name = "DEV"
		new_DEV.global_position = i
	
	## CONNECT COLLISION SIGNALS
	for o in obstaclecontainer.get_children():
		if o.name.begins_with("D"):
			o.connect("collision", _on_collision)
	
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
	
	## IF FINAL LEVEL, ADD THANK YOU NOTE
	if Global.current_level == 25:
		thankyou.visible = true
	else:
		thankyou.visible = false

func _process(_delta):
	if success: return
	
	if time > 0:
		reset_text.text = "RESET"
	else:
		reset_text.text = "MENU"
	
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
	cursor_snap.global_position = Vector2(clamp(floor(mousepos.x / 64) * 64 + 32, 32, Global.MAPSIZE - 32), clamp(floor(mousepos.y / 64) * 64 + 32, 32, Global.MAPSIZE - 32))
	
	## MOST OF THIS FUNCTION ONLY CALLS IF THE MOUSE IS HOLDING A FLOW CIRCLE
	if current_flow_node != null and flow_dict.has(current_flow_color):
		
		## SET "CURSOR_CLOCK" TO ONLY VALID TILES
		var is_valid = true
		
		## GOING BACKWARDS 1 TILE IS A VALID TILE
		if flow_dict.get(current_flow_color).has(cursor_snap.global_position): 
			@warning_ignore("unassigned_variable")
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
			var text = str(Global.current_level) + " | " + str(time)
			clock_text.text = text
			#Global.total_moves += 1
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
		if Global.move_counter[Global.current_level] == 0 or Global.move_counter[Global.current_level] > time: Global.move_counter[Global.current_level] = time
		get_parent().get_parent().advance_level(cursor_clock)

func _on_collision(pos):
	var col = collision_image.instantiate()
	canvas.add_child(col)
	col.global_position = pos

func _on_reset_button_pressed():
	if time == 0:
		Global.current_level = 0
		Global.menu = 0
		get_parent().get_parent().load_level()
		queue_free()
	else:
		Global.total_resets += 1
		get_parent().get_parent().reset_level()

## DRAW GRID LINES
func _draw():
	var step = 0
	for i in range(0,8):
		draw_line(Vector2(0,step),Vector2(Global.MAPSIZE,step),Color.WHITE,-1,false)
		draw_line(Vector2(step,0),Vector2(step,Global.MAPSIZE),Color.WHITE,-1,false)
		step += 64
