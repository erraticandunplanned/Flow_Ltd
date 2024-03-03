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
var flow = []

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
	
	var neworb = Sprite2D.new()
	flowcontainer.add_child(neworb)
	neworb.texture = circle
	neworb.name = "start"
	#neworb.modulate.from_ok_hsl(17,73,57,255)
	neworb.global_position = Vector2(96,224)
	flow.append(neworb.global_position)


func _process(delta):
	## REVERSE OF THE FLOW ARRAY. USED LATER ON
	
	
	## ON MOUSE CLICK, SET NEAREST FLOW NODE TO CURRENT
	if Input.is_action_just_pressed("left_mouse_click"):
		for i in flowcontainer.get_children():
			if get_global_mouse_position().distance_to(i.global_position) < 32:
				current_flow_node = i
				current_flow_node.modulate = Color.MEDIUM_PURPLE
	
	## ON MOUSE RELEASE, SET CURRENT FLOW NODE TO NULL
	if Input.is_action_just_released("left_mouse_click"):
		current_flow_node.modulate = Color.WHITE
		current_flow_node = null
	
	## SET "CURSOR_SNAP" TO THE NEAREST GRID LOCATION OF MOUSE
	var mousepos = get_global_mouse_position()
	cursor_snap.global_position = Vector2(clamp(floor(mousepos.x / 64) * 64 + 32, 32, MAPSIZE.x - 32), clamp(floor(mousepos.y / 64) * 64 + 32, 32, MAPSIZE.y - 32))
	
	if current_flow_node != null:
		
		## SET "CURSOR_CLOCK" TO ONLY VALID TILES
		var is_valid = true
		if flow.has(cursor_snap.global_position): 
			var reverse_flow : Array
			reverse_flow.append_array(flow)
			reverse_flow.reverse()
			if reverse_flow.size() > 1:
				if reverse_flow[1] == cursor_snap.global_position:
					flow.remove_at(flow.size()-1)
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
			flow.append(current_flow_node.global_position)
			var reverse_flow : Array
			reverse_flow.append_array(flow)
			reverse_flow.reverse()
			canvas.call_remote_draw(reverse_flow[1], reverse_flow[0], Color.WHITE, 32.0)
			
			## ADVANCE CLOCK
			time += 1
			var text = str(time)
			clock.text = text
