@tool
extends Node2D

@onready var mesh_node : MeshInstance2D = $shape

var timer = 0.0
var lifetime = 0.0

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-5,-14),
			Vector2(-4,-32),
			Vector2(0,-17),
			Vector2(3,-24),
			Vector2(4,-16),
			Vector2(11,-27),
			Vector2(8,-12),
			Vector2(23,-18),
			Vector2(13,-7),
			Vector2(22,-8),
			Vector2(16,-4),
			Vector2(28,-3),
			Vector2(15,2),
			Vector2(27,12),
			Vector2(14,8),
			Vector2(20,16),
			Vector2(11,12),
			Vector2(18,25),
			Vector2(4,12),
			Vector2(3,30),
			Vector2(0,18),
			Vector2(-3,24),
			Vector2(-4,14),
			Vector2(-13,27),
			Vector2(-9,9),
			Vector2(-25,18),
			Vector2(-14,8),
			Vector2(-23,9),
			Vector2(-14,3),
			Vector2(-31,3),
			Vector2(-17,-3),
			Vector2(-29,-13),
			Vector2(-16,-9),
			Vector2(-20,-14),
			Vector2(-10,-10),
			Vector2(-19,-26),
			
			# CENTRE
			Vector2(0,0)
		]
	)
	meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(
		[
			## SPIKES
			0,1,2,
			2,3,4,
			4,5,6,
			6,7,8,
			8,9,10,
			10,11,12,
			12,13,14,
			14,15,16,
			16,17,18,
			18,19,20,
			20,21,22,
			22,23,24,
			24,25,26,
			26,27,28,
			28,29,30,
			30,31,32,
			32,33,34,
			34,35,0,
			
			## CENTRE
			0,2,36,
			2,4,36,
			4,6,36,
			6,8,36,
			8,10,36,
			10,12,36,
			12,14,36,
			14,16,36,
			16,18,36,
			18,20,36,
			20,22,36,
			22,24,36,
			24,26,36,
			26,28,36,
			28,30,36,
			30,32,36,
			32,34,36,
			34,0,36,
		]
	)
	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray(
		[
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
			Color.WHITE,
		]
	)
	
	mesh_node.mesh = ArrayMesh.new()
	mesh_node.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)

func _process(delta):
	lifetime += delta
	timer += delta
	if timer > 0.1:
		rotate(PI/2)
		timer = 0
	if lifetime > 0.4:
		queue_free()
