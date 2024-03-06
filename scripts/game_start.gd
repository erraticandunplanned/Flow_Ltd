extends Node2D

@onready var level_loader = $level_loader
@onready var basic_scene = preload("res://scenes/base_level.tscn")

@onready var transition_node = $transition
@onready var bottom_shutter = $transition/bottom_shutter
@onready var left_shutter = $transition/left_shutter
@onready var right_shutter = $transition/right_shutter
@onready var top_shutter = $transition/top_shutter

var current_scene
var loading_time = 0
var loading = false

func _ready():
	for shutter in [bottom_shutter,left_shutter,right_shutter,top_shutter]:
		var meshdata = []
		meshdata.resize(ArrayMesh.ARRAY_MAX)
		meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array([Vector2(-256,-256),Vector2(256,-256),Vector2(256,256),Vector2(-256,256),])
		meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array([0,1,2,2,3,0,])
		meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray([Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,])
		shutter.mesh = ArrayMesh.new()
		shutter.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
	reset_shutters()
	load_scene()

func reset_shutters():
	transition_node.global_position = Vector2(0,0)
	bottom_shutter.global_position = Vector2(768,1280)
	left_shutter.global_position = Vector2(-768,768)
	right_shutter.global_position = Vector2(1280,768)
	top_shutter.global_position = Vector2(768,-768)

func load_scene():
	current_scene = basic_scene.instantiate()
	current_scene.name = str("level ", Global.current_level)
	level_loader.add_child(current_scene)

func advance_level(location):
	print("Win!")
	transition_node.global_position += Vector2(-256,-256)
	loading = true
	current_scene.queue_free()
	Global.current_level += 1
	if Global.current_level < 3: load_scene()

func _process(delta):
	if not loading: return
	
	loading_time += delta
	print(loading_time)
	if loading_time > 0.25:
		bottom_shutter.global_position.y += -64
		left_shutter.global_position.x += 64
		right_shutter.global_position.x += -64
		top_shutter.global_position.y += 64
		loading_time = 0
	if bottom_shutter.global_position.y <= -128: 
		loading = false
		loading_time = 0
		reset_shutters()
