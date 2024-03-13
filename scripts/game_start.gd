extends Node2D

@onready var level_loader = $level_loader
@onready var basic_scene = preload("res://scenes/base_level.tscn")
@onready var menu_scene = preload("res://scenes/menu_level.tscn")

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
	Global.completion[Global.current_level] = true
	current_scene.queue_free()
	Global.current_level += 1
	for i in range(0,36):
		if not Levels.levels.has(Global.current_level):
			Global.current_level += 1
		else: break
	
	if Levels.levels.has(Global.current_level):
		load_level()
	else:
		Global.current_level = 0
		Global.menu = Global.main_menu
		load_level()
