extends Node2D

@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var obstaclecontainer = $obstacle_container
@onready var canvas = $draw_canvas
@onready var clock_text = $CanvasLayer/Control/CenterContainer/vert/Clock
@onready var reset_text = $CanvasLayer/Control/CenterContainer/vert/reset_text
@onready var cursor_snap = $cursor_snap
@onready var cursor_clock = $cursor_clock

@onready var menutext_main = $Labels/main_menu
@onready var menutext_levels = $Labels/level_select
@onready var menutext_about = $Labels/about

@onready var count_level = $Labels/main_menu/STATBLOCK/count_levels/CenterContainer/Label
@onready var count_moves = $Labels/main_menu/STATBLOCK/count_moves/CenterContainer/Label
@onready var count_reset = $Labels/main_menu/STATBLOCK/count_resets/CenterContainer/Label

@onready var gridtile = preload("res://scenes/gridtile.tscn")

var time = 0
var current_flow_node : Node
var current_flow_color : Color
var success = false

var flow_dict = Levels.menu_levels.get(Global.menu).get(Global.flow_dictionary).duplicate(true)
var goal_dict = Levels.menu_levels.get(Global.menu).get(Global.goal_dictionary).duplicate(true)
var obstacle_dict = Levels.menu_levels.get(Global.menu).get(Global.obstacle_dictionary).duplicate(true)

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
	
	## SET MENU TEXT
	if Global.menu == Global.main_menu:
		menutext_main.visible = true
		menutext_levels.visible = false
		menutext_about.visible = false
		if Global.completion[1] == true:
			for i in obstaclecontainer.get_children():
				if i.global_position == Vector2(416,224):
					i.queue_free()
			menutext_main.find_child("LEVELS").visible = true
			menutext_main.find_child("STATBLOCK").visible = true
			var level_count = -1
			for i in Global.completion:
				if i == true: level_count += 1
			count_level.text = str(level_count)
			count_moves.text = str(Global.total_moves)
			count_reset.text = str(Global.total_resets)
		else:
			menutext_main.find_child("LEVELS").visible = false
			menutext_main.find_child("STATBLOCK").visible = false
			goal_dict.erase(Color(0.827450, 0.827451, 0.827451, 1))
	if Global.menu == Global.about:
		menutext_main.visible = false
		menutext_levels.visible = false
		menutext_about.visible = true
	if Global.menu == Global.level_select:
		menutext_main.visible = false
		menutext_levels.visible = true
		menutext_about.visible = false
		for i in menutext_levels.get_children():
			if i.name == "Back": continue
			else:
				var check_circle = i.name.to_int() -1
				if Global.completion[check_circle] == true:
					pass
				else:
					var new_grid = gridtile.instantiate()
					obstaclecontainer.add_child(new_grid)
					new_grid.global_position = Vector2(i.global_position.x + 32, i.global_position.y + 32)
					new_grid.name = str("level ", i.name)
	
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

func _process(_delta):
	if success: return
	
	if Global.menu != 0:
		reset_text.text = "MENU"
	else:
		reset_text.text = ""
	
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
		if current_flow_node != null: check_for_win(current_flow_node.global_position)
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
	
	queue_redraw()

## CHECK FOR "WIN CONDITION" BASED ON MENU
func check_for_win(pos):
	if current_flow_node != null:
		if Global.menu == Global.main_menu:
			if pos == Vector2(416,288):
				Global.current_level = 1
				get_parent().get_parent().load_level()
				queue_free()
			elif pos == Vector2(416,224):
				Global.menu = Global.level_select
				get_parent().get_parent().load_level()
				queue_free()
			elif pos == Vector2(160,288):
				Global.menu = Global.about
				get_parent().get_parent().load_level()
				queue_free()
			elif pos == Vector2(288,416):
				get_tree().quit()
		
		elif Global.menu == Global.level_select:
			if pos == Vector2(32,160):
				Global.menu = Global.main_menu
				get_parent().get_parent().load_level()
				queue_free()
			else:
				var target_level = 0
				match pos:
					Vector2(96,96): target_level = 1
					Vector2(160,96): target_level = 2
					Vector2(224,96): target_level = 3
					Vector2(288,96): target_level = 4
					Vector2(352,96): target_level = 5
					Vector2(416,96): target_level = 6
					Vector2(96,160): target_level = 7
					Vector2(160,160): target_level = 8
					Vector2(224,160): target_level = 9
					Vector2(288,160): target_level = 10
					Vector2(352,160): target_level = 11
					Vector2(416,160): target_level = 12
					Vector2(96,224): target_level = 13
					Vector2(160,224): target_level = 14
					Vector2(224,224): target_level = 15
					Vector2(288,224): target_level = 16
					Vector2(352,224): target_level = 17
					Vector2(416,224): target_level = 18
					Vector2(96,288): target_level = 19
					Vector2(160,288): target_level = 20
					Vector2(224,288): target_level = 21
					Vector2(288,288): target_level = 22
					Vector2(352,288): target_level = 23
					Vector2(416,288): target_level = 24
					Vector2(96,352): target_level = 25
					Vector2(160,352): target_level = 26
					Vector2(224,352): target_level = 27
					Vector2(288,352): target_level = 28
					Vector2(352,352): target_level = 29
					Vector2(416,352): target_level = 30
					Vector2(96,416): target_level = 31
					Vector2(160,416): target_level = 32
					Vector2(224,416): target_level = 33
					Vector2(288,416): target_level = 34
					Vector2(352,416): target_level = 35
					Vector2(416,416): target_level = 36
				if Levels.levels.has(target_level):
					Global.current_level = target_level
					get_parent().get_parent().load_level()
					queue_free()
				else:
					print("Level doesn't exist yet :(")
		
		elif Global.menu == Global.about:
			if pos == Vector2(96,224):
				Global.menu = Global.main_menu
				get_parent().get_parent().load_level()
				queue_free()

func _on_reset_button_pressed():
	if time == 0:
		Global.menu = Global.main_menu
	
	get_parent().get_parent().load_level()
	queue_free()

## DRAW GRID LINES
func _draw():
	var step = 0
	for i in range(0,8):
		draw_line(Vector2(0,step),Vector2(Global.MAPSIZE,step),Color.WHITE,-1,false)
		draw_line(Vector2(step,0),Vector2(step,Global.MAPSIZE),Color.WHITE,-1,false)
		step += 64
