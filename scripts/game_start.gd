extends Node2D

@onready var level_loader = $level_loader
@onready var basic_scene = preload("res://scenes/base_level.tscn")
@onready var menu_scene = preload("res://scenes/menu_level.tscn")

#@onready var transition_node = $transition
#@onready var bottom_shutter = $transition/bottom_shutter
#@onready var left_shutter = $transition/left_shutter
#@onready var right_shutter = $transition/right_shutter
#@onready var top_shutter = $transition/top_shutter

var current_scene
var loading_time = 0
var loading = false

func _ready():
	#for shutter in [bottom_shutter,left_shutter,right_shutter,top_shutter]:
	#	var meshdata = []
	#	meshdata.resize(ArrayMesh.ARRAY_MAX)
	#	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array([Vector2(0,0),Vector2(Global.MAPSIZE,0),Vector2(Global.MAPSIZE,Global.MAPSIZE),Vector2(0,Global.MAPSIZE)])
	#	meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array([0,1,2,2,3,0])
	#	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray([Color.DARK_SLATE_BLUE,Color.DARK_SLATE_BLUE,Color.DARK_SLATE_BLUE,Color.DARK_SLATE_BLUE])
	#	shutter.mesh = ArrayMesh.new()
	#	shutter.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
	#reset_shutters()
	load_level()

#func reset_shutters():
#	transition_node.global_position = Vector2(0,0)
#	bottom_shutter.global_position = Vector2(0,Global.MAPSIZE*2-32)
#	left_shutter.global_position = Vector2(-Global.MAPSIZE*2+32,0)
#	right_shutter.global_position = Vector2(Global.MAPSIZE*2-32,0)
#	top_shutter.global_position = Vector2(0,-Global.MAPSIZE*2+32)

func load_level():
	## CHECK FOR MENU
	if Global.current_level == 0:
		current_scene = menu_scene.instantiate()
	else:
		current_scene = basic_scene.instantiate()
	current_scene.name = str("level ", Global.current_level)
	level_loader.add_child(current_scene)

func reset_level():
	current_scene.queue_free()
	current_scene = basic_scene.instantiate()
	current_scene.name = str("level ", Global.current_level)
	level_loader.add_child(current_scene)

func advance_level(location):
	current_scene.queue_free()
	Global.current_level += 1
	if Global.levels.has(Global.current_level): 
		load_level()
