@tool
extends MeshInstance2D

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-32,0),
			Vector2(32,0),
			Vector2(0,32),
			Vector2(-32,0),
			Vector2(32,0),
			Vector2(0,-32)
		]
	)
	meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(
		[
			0,1,2,
			3,4,5
		]
	)
	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray(
		[
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.HOT_PINK,
			Color.HOT_PINK,
			Color.HOT_PINK
		]
	)
	
	mesh = ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
