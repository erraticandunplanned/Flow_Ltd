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
@onready var menutext_settings_display = $Labels/settings_display
#@onready var menutext_settings_audio =
#@onready var menutext_settings_game =
@onready var menutext_settings_color = $Labels/settings_color
#@onready var menutext_settings_player =

@onready var count_level = $Labels/main_menu/STATBLOCK/count_levels/CenterContainer/Label
@onready var count_moves = $Labels/main_menu/STATBLOCK/count_moves/CenterContainer/Label
@onready var count_reset = $Labels/main_menu/STATBLOCK/count_resets/CenterContainer/Label

@onready var gridtile = preload("res://scenes/gridtile.tscn")

var time = 0
var cheat_unlock = 0
var current_flow_node : Node
var current_flow_index : int
#var current_flow_color : Color
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
		menutext_settings_display.visible = false
		#menutext_settings_audio.visible = false
		#menutext_settings_game.visible = false
		menutext_settings_color.visible = false
		#menutext_settings_player.visible = false
		
		
		goal_dict.clear()
		var goal_entry_1 = Global.node_colors[1] + Color(0.000001,0,0,1)
		var goal_entry_2 = Global.node_colors[1] + Color(0,0.000001,0,1)
		var goal_entry_3 = Global.node_colors[1] + Color(0,0,0.000001,1)
		var goal_entry_4 = Global.node_colors[1] + Color(0.000001,0.000001,0,1)
		var new_goal_colors = {
			goal_entry_1: Vector2(416,288),
			goal_entry_2: Vector2(288,416),
			goal_entry_3: Vector2(416,224),
			goal_entry_4: Vector2(96,288),
		}
		goal_dict.merge(new_goal_colors)
		
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
			var total_moves = 0
			for i in Global.move_counter.size():
				total_moves += Global.move_counter[i]
			count_moves.text = str(total_moves)
			count_reset.text = str(Global.total_resets)
		else:
			menutext_main.find_child("LEVELS").visible = false
			menutext_main.find_child("STATBLOCK").visible = false
			goal_dict.erase(goal_entry_3)
	if Global.menu == Global.about:
		menutext_main.visible = false
		menutext_levels.visible = false
		menutext_about.visible = true
		menutext_settings_display.visible = false
		#menutext_settings_audio.visible = false
		#menutext_settings_game.visible = false
		menutext_settings_color.visible = false
		#menutext_settings_player.visible = false
	if Global.menu == Global.level_select:
		menutext_main.visible = false
		menutext_levels.visible = true
		menutext_about.visible = false
		menutext_settings_display.visible = false
		#menutext_settings_audio.visible = false
		#menutext_settings_game.visible = false
		menutext_settings_color.visible = false
		#menutext_settings_player.visible = false
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
	if Global.menu == Global.settings_display:
		menutext_main.visible = false
		menutext_levels.visible = false
		menutext_about.visible = false
		menutext_settings_display.visible = true
		#menutext_settings_audio.visible = false
		#menutext_settings_game.visible = false
		menutext_settings_color.visible = false
		#menutext_settings_player.visible = false
	if Global.menu == Global.settings_color:
		menutext_main.visible = false
		menutext_levels.visible = false
		menutext_about.visible = false
		menutext_settings_display.visible = false
		#menutext_settings_audio.visible = false
		#menutext_settings_game.visible = false
		menutext_settings_color.visible = true
		#menutext_settings_player.visible = false
		
		var flow_entry_1 = {}
		var flow_entry_2 = {}
		var flow_entry_3 = {}
		var flow_entry_4 = {}
		
		for c in Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).keys():
			if c is Color:
				if Global.node_colors.get(1) == c: flow_entry_1 = {1: [Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).get(c)]}
				elif Global.node_colors.get(2) == c: flow_entry_2 = {2: [Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).get(c)]}
				elif Global.node_colors.get(3) == c: flow_entry_3 = {3: [Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).get(c)]}
				elif Global.node_colors.get(4) == c: flow_entry_4 = {4: [Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).get(c)]}
		
		flow_dict.clear()
		flow_dict.merge(flow_entry_1)
		flow_dict.merge(flow_entry_2)
		flow_dict.merge(flow_entry_3)
		flow_dict.merge(flow_entry_4)
		flow_dict.merge({99:[Vector2(352,480)]})
	
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
						current_flow_index = j
	
	## ON MOUSE RELEASE, SET CURRENT FLOW NODE TO NULL
	if Input.is_action_just_released("left_mouse_click"):
		if current_flow_node != null: check_for_win(current_flow_node.global_position)
		current_flow_node = null
		current_flow_index = 0
		
	
	## SET "CURSOR_SNAP" TO THE NEAREST GRID LOCATION OF MOUSE
	var mousepos = get_global_mouse_position()
	cursor_snap.global_position = Vector2(clamp(floor(mousepos.x / 64) * 64 + 32, 32, (Global.MAP_TILE_SIZE.y * Global.MAP_MAX_SIZE.y) - 32), clamp(floor(mousepos.y / 64) * 64 + 32, 32, (Global.MAP_TILE_SIZE.y * Global.MAP_MAX_SIZE.y) - 32))
	
	## MOST OF THIS FUNCTION ONLY CALLS IF THE MOUSE IS HOLDING A FLOW CIRCLE
	if current_flow_node != null and flow_dict.has(current_flow_index):
		
		## SET "CURSOR_CLOCK" TO ONLY VALID TILES
		var is_valid = true
		
		## GOING BACKWARDS 1 TILE IS A VALID TILE
		if flow_dict.get(current_flow_index).has(cursor_snap.global_position): 
			@warning_ignore("unassigned_variable")
			var reverse_flow : Array
			reverse_flow.append_array(flow_dict.get(current_flow_index))
			reverse_flow.reverse()
			if reverse_flow.size() > 1:
				if reverse_flow[1] == cursor_snap.global_position:
					flow_dict.get(current_flow_index).remove_at(flow_dict.get(current_flow_index).size()-1)
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
			flow_dict.get(current_flow_index).append(current_flow_node.global_position)
			canvas.update_flow(flow_dict)
			
			## ADVANCE CLOCK
			cheat_unlock = 0
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
			elif pos == Vector2(96,288):
				Global.menu = Global.about
				get_parent().get_parent().load_level()
				queue_free()
			elif pos == Vector2(288,416):
				Global.menu = Global.settings_display
				get_parent().get_parent().load_level()
				queue_free()
		
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
			if pos == Vector2(96,288):
				Global.menu = Global.main_menu
				get_parent().get_parent().load_level()
				queue_free()
		
		elif Global.menu == Global.settings_display:
			if current_flow_index == 1:
				match pos:
					Vector2(96,480): Global.menu = Global.main_menu
					Vector2(160,480): pass
					Vector2(224,480): pass
					Vector2(288,480): pass
					Vector2(352,480): Global.menu = Global.settings_color
					Vector2(416,480): pass
				get_parent().get_parent().load_level()
				queue_free()
		
		elif Global.menu == Global.settings_color:
			if current_flow_index == 99:
				match pos:
					Vector2(96,480): Global.menu = Global.main_menu
					Vector2(160,480): Global.menu = Global.settings_display
					Vector2(224,480): pass
					Vector2(288,480): pass
					Vector2(352,480): pass
					Vector2(416,480): pass
			else:
				for c in Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).keys():
					if Levels.menu_levels.get(Global.settings_color).get(Global.goal_dictionary).get(c) == pos and c is Color:
						match current_flow_index:
							1: Global.node_colors[1] = c
							2: Global.node_colors[2] = c
							3: Global.node_colors[3] = c
							4: Global.node_colors[4] = c
			get_parent().get_parent().load_level()
			queue_free()

func _on_reset_button_pressed():
	cheat_unlock += 1
	if Global.menu == Global.main_menu:
		if cheat_unlock >= 25:
			Global.unlock(25)
			get_parent().get_parent().load_level()
			queue_free()
	else:
		Global.menu = Global.main_menu
		get_parent().get_parent().load_level()
		queue_free()

## DRAW GRID LINES
func _draw():
	var step = 0
	for i in range(0,8):
		draw_line(Vector2(0,step),Vector2(Global.MAP_TILE_SIZE.x * Global.MAP_MAX_SIZE.x , step),Color.WHITE,-1,false)
		draw_line(Vector2(step,0),Vector2(step , Global.MAP_TILE_SIZE.y * Global.MAP_MAX_SIZE.y),Color.WHITE,-1,false)
		step += 64
