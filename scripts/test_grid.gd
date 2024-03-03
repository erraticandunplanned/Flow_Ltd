extends Node2D

@onready var gridtile = preload("res://textures/grid.png")
@onready var gridtile_black = preload("res://textures/grid_blank.png")
@onready var circle = preload("res://textures/basic_dot.png")
@onready var gridcontainer = $grid_container
@onready var flowcontainer = $flow_container
@onready var cursor = $cursor

var previous_object : Node
var current_object : Node : 
	set(obj) : _on_current_object_changed(obj)

var is_dragging = false
var cursor_location = Vector2(0,0)

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
				current_object = i
	
	if Input.is_action_just_released("left_mouse_click"):
		current_object = null
	
	var mousepos = get_global_mouse_position()
	cursor.global_position.x = floor(mousepos.x / 64) * 64 + 32
	cursor.global_position.y = floor(mousepos.y / 64) * 64 + 32

func _on_current_object_changed(obj):
	if obj != null:
		previous_object = obj
		obj.modulate.a = 0.5
	elif previous_object != null:
		previous_object.modulate.a = 1
