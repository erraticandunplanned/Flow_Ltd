extends Node2D

@onready var basic_scene = preload("res://scenes/base_level.tscn")

func _ready():
	var start = basic_scene.instantiate()
	add_child(start)

func advance_level():
	print("Win!")
