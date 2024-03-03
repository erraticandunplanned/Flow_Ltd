extends Node2D

@onready var gridtile = preload("res://textures/grid.png")
@onready var gridtile_black = preload("res://textures/grid_blank.png")
@onready var circle = preload("res://textures/basic_dot.png")
@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var cursor = $cursor
@onready var canvas = $draw_canvas

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
			gridcontainer.add_child(newtile)
			
			if i > 0 and i < 7 and j == 3: newtile.texture = gridtile
			else: newtile.texture = gridtile_black
			newtile.name = str(i) + "," + str(j)
			newtile.global_position = Vector2(i * 64 + 32, j * 64 + 32)
	
	var neworb = Sprite2D.new()
	flowcontainer.add_child(neworb)
	neworb.texture = circle
	neworb.name = "start"
	#neworb.modulate.from_ok_hsl(17,73,57,255)
	neworb.global_position = Vector2(96,224)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#cursor.global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("left_mouse_click"):
		for i in flowcontainer.get_children():
			if get_global_mouse_position().distance_to(i.global_position) < 32:
				instant_object = i
				is_dragging = true
	
	if Input.is_action_just_released("left_mouse_click"):
		instant_object = null
		is_dragging = false
	
	var mousepos = get_global_mouse_position()
	
	cursor.global_position.x = floor(mousepos.x / 64) * 64 + 32
	cursor.global_position.y = floor(mousepos.y / 64) * 64 + 32
	
	
	if is_dragging and current_object != null:
		current_object.global_position = cursor.global_position
		if cursor.global_position != current_cursor_location:
			canvas.call_remote_draw(previous_cursor_location, current_cursor_location, Color.WHITE, 32.0)
			#draw_line(previous_cursor_location, current_cursor_location, Color(0, 1, 1, 1), 16, false)
			print("draw?")
	
	if cursor.global_position != current_cursor_location: 
		previous_cursor_location = current_cursor_location
		current_cursor_location = cursor.global_position
		#print("previous_cursor_location", previous_cursor_location)
		#print("current_cursor_location", current_cursor_location)
		#print("")

func _on_current_object_changed(obj):
	if obj != null:
		current_object = obj
		obj.modulate.a = 0.5
	elif current_object != null:
		current_object.modulate.a = 1
