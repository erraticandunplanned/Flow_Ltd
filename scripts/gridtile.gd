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
	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray(
		[
			Color.SLATE_GRAY,
			Color.SLATE_GRAY,
			Color.SLATE_GRAY,
			Color.SLATE_GRAY
		]
	)
	
	mesh_node.mesh = ArrayMesh.new()
	mesh_node.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
