@tool
extends Node2D

@onready var mesh_node : MeshInstance2D = $square

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-32,-32),
			Vector2(32,-32),
			Vector2(32,32),
			Vector2(-32,32),
		]
	)
	meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(
		[
			0,1,2,
			2,3,0,
		]
	)
	var color_array = []
	color_array.resize(meshdata[ArrayMesh.ARRAY_VERTEX].size())
	for i in range(0,color_array.size()):
		color_array[i] = Color(0.1,0.1,0.1,1)
	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray(color_array)
	
	mesh_node.mesh = ArrayMesh.new()
	mesh_node.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
