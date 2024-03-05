extends Node2D

## DIV OBSTACLE
## the DIV obstacle move in a straight line until it hits a wall, reverses direction, then moves again
## if a DIV obstacle collides with a flow node or goal node, it destroys it
## the DIV obstacle is a pair of triangles

@onready var mesh_node : MeshInstance2D = $shape

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-32,0),
			Vector2(32,0),
			Vector2(0,-32),
			Vector2(-32,0),
			Vector2(32,0),
			Vector2(0,32)
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
	
	mesh_node.mesh = ArrayMesh.new()
	mesh_node.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
	
	var world = get_parent().get_parent()
	world.connect("clock_update", _on_clock_update)

func _on_clock_update(t):
	pass
