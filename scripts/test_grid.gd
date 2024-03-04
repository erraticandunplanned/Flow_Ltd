extends Node2D

@onready var gridtile = preload("res://textures/grid.png")
@onready var gridtile_black = preload("res://textures/grid_blank.png")
@onready var circle = preload("res://textures/basic_dot.png")
@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var obstaclecontainer = $obstacle_container
@onready var canvas = $draw_canvas
@onready var clock = $CanvasLayer/Control/TextEdit
@onready var cursor_snap = $cursor_snap
@onready var cursor_clock = $cursor_clock

const MAPSIZE = Vector2(512,512)

var time = 0
var current_flow_node : Node
var current_flow_color : Color

var flow_dict = {
	Color.WHITE_SMOKE: [],
	Color.LIGHT_CORAL: [],
	#Color.MEDIUM_AQUAMARINE: []
}

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,8):
		for j in range(0,8):
			var newtile = Sprite2D.new()
			
			
			if i > 0 and i < 7 and j > 2 and j < 5: 
				gridcontainer.add_child(newtile)
				newtile.texture = gridtile
			else: 
				obstaclecontainer.add_child(newtile)
				newtile.texture = gridtile_black
			
			newtile.name = str(i) + "," + str(j)
			newtile.global_position = Vector2(i * 64 + 32, j * 64 + 32)
	
	var new_flow = Node2D.new()
	flowcontainer.add_child(new_flow)
	new_flow.name = "LIGHT_CORAL"
	new_flow.global_position = Vector2(96,224)
	flow_dict.get(Color.LIGHT_CORAL).append(new_flow.global_position)
	canvas.update_flow(flow_dict)
	#canvas.update_flow(new_flow.global_position, Color.LIGHT_CORAL)
	
	var new_flow_2 = Node2D.new()
	flowcontainer.add_child(new_flow_2)
	new_flow_2.name = "WHITE_SMOKE"
	new_flow_2.global_position = Vector2(96,288)
	flow_dict.get(Color.WHITE_SMOKE).append(new_flow_2.global_position)
	canvas.update_flow(flow_dict)
	

func _process(delta):
	
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
	
	if current_flow_node != null:
		
		## SET "CURSOR_CLOCK" TO ONLY VALID TILES
		var is_valid = true
		if flow_dict.get(current_flow_color).has(cursor_snap.global_position): 
			var reverse_flow : Array
			reverse_flow.append_array(flow_dict.get(current_flow_color))
			reverse_flow.reverse()
			if reverse_flow.size() > 1:
				if reverse_flow[1] == cursor_snap.global_position:
					flow_dict.get(current_flow_color).remove_at(flow_dict.get(current_flow_color).size()-1)
					canvas.remove_previous()
					is_valid = true
				else: is_valid = false
			else:
				is_valid = false
		for i in obstaclecontainer.get_children():
			if i.global_position == cursor_snap.global_position: is_valid = false
		
		if is_valid: cursor_clock.global_position = cursor_snap.global_position
		
		## ENSURE FLOW NODE ONLY MOVES ORTHOGONALLY A SINGLE TILE
		if is_valid and abs(current_flow_node.global_position.x - cursor_clock.global_position.x) + abs(current_flow_node.global_position.y - cursor_clock.global_position.y) == 64:
			
			## UPDATE FLOW POSITION AND DRAW LINES
			current_flow_node.global_position = cursor_clock.global_position
			flow_dict.get(current_flow_color).append(current_flow_node.global_position)
			var reverse_flow : Array
			reverse_flow.append_array(flow_dict.get(current_flow_color))
			reverse_flow.reverse()
			canvas.call_remote_draw(reverse_flow[1], reverse_flow[0], current_flow_color)
			canvas.update_flow(flow_dict)
			#canvas.update_flow(reverse_flow[0], current_flow_color)
			
			## ADVANCE CLOCK
			time += 1
			var text = str(time)
			clock.text = text
