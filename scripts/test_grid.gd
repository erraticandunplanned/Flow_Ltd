extends Node2D

@onready var gridtile = preload("res://textures/grid.png")
@onready var gridtile_black = preload("res://textures/grid_blank.png")
@onready var circle = preload("res://textures/basic_dot.png")
@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var obstaclecontainer = $obstacle_container
@onready var canvas = $draw_canvas
@onready var clock = $CanvasLayer/Control/TextEdit
@onready var cursor = $cursor

var time = 0
var current_object : Node
var instant_object : Node : 
	set(obj) : _on_current_object_changed(obj)

var is_dragging = false
var current_cursor_location = Vector2(0,0)
var previous_cursor_location = Vector2(0,0)

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


func _process(delta):
	
	if Input.is_action_just_pressed("left_mouse_click"):
		for i in flowcontainer.get_children():
			if get_global_mouse_position().distance_to(i.global_position) < 32:
				instant_object = i
				is_dragging = true
	
	if Input.is_action_just_released("left_mouse_click"):
		instant_object = null
		is_dragging = false
	
	var mousepos = get_global_mouse_position()
	if mousepos.x < 0 or mousepos.y < 0 or mousepos.x > 512 or mousepos.y > 512:
		instant_object = null
		is_dragging = false
	
	var checkpos = Vector2(floor(mousepos.x / 64) * 64 + 32, floor(mousepos.y / 64) * 64 + 32)
	var is_valid_location = false
	if abs(current_cursor_location.x - checkpos.x) == 64: is_valid_location = true
	if abs(current_cursor_location.y - checkpos.y) == 64: is_valid_location = true
	if previous_cursor_location == Vector2(0,0): is_valid_location = true
	for i in obstaclecontainer.get_children():
		if i.global_position == checkpos: is_valid_location = false
	if checkpos == current_cursor_location: is_valid_location = false
	if is_valid_location: 
		cursor.global_position = checkpos
		if current_cursor_location != Vector2(0,0):
			update_clock()
	
	if is_dragging and current_object != null and cursor.global_position != current_cursor_location:
		current_object.global_position = cursor.global_position
		previous_cursor_location = current_cursor_location
		current_cursor_location = cursor.global_position
		if previous_cursor_location != Vector2(0,0):
			canvas.call_remote_draw(previous_cursor_location, current_cursor_location, Color.WHITE, 32.0)
			var new_obstacle = Node2D.new()
			obstaclecontainer.add_child(new_obstacle)
			new_obstacle.global_position = previous_cursor_location

func _on_current_object_changed(obj):
	if obj != null:
		current_object = obj
		obj.modulate = Color.MEDIUM_PURPLE
	elif current_object != null:
		current_object.modulate = Color.WHITE

func update_clock():
	time += 1
	var text = str(time)
	clock.text = text
