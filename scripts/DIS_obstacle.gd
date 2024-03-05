extends Node2D

## DIS OBSTACLE
## the DIS obstacle move in a straight line until it hits a wall, reverses direction, then moves again
## the DIS obstacle is a pair of squares

@onready var mesh_node : MeshInstance2D = $shape

var facing = Vector2.UP

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-16,0),
			Vector2(-16,-32),
			Vector2(16,-32),
			Vector2(16,0),
			
			Vector2(-16,0),
			Vector2(16,0),
			Vector2(16,32),
			Vector2(-16,32)
		]
	)
	meshdata[ArrayMesh.ARRAY_INDEX] = PackedInt32Array(
		[
			0,1,2,
			2,3,0,
			4,5,6,
			6,7,4
		]
	)
	meshdata[ArrayMesh.ARRAY_COLOR] = PackedColorArray(
		[
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.HOT_PINK,
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
	## CHECK FOR VALID POSITION
	var check_pos = global_position + ( facing * 64 )
	var is_valid = true
	if check_pos.x > 512 or check_pos.x < 0 or check_pos.y > 512 or check_pos.y < 0: is_valid = false
	var flow_lines = get_parent().get_parent().flow_dict
	for k in flow_lines.keys():
		var array = flow_lines.get(k)
		for i in array:
			if check_pos == i: is_valid = false
	
	## STOP AND ROTATE IF NOT VALID. MOVE IF SO
	if not is_valid:
		check_pos = global_position
		facing = facing * -1
		global_rotation += PI
	global_position = check_pos
