extends Node2D

## DIV OBSTACLE
## the DIV obstacle move in a straight line until it hits a wall, reverses direction, then moves again
## if a DIV obstacle collides with a flow node or goal node, it destroys it
## the DIV obstacle is a pair of triangles

@onready var mesh_node : MeshInstance2D = $shape

var facing = Vector2.UP

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
	## CHECK FOR VALID POSITION
	var check_pos = global_position + ( facing * 64 )
	var is_valid = true
	
	## CANNOT GO OUTSIDE THE GRID
	if check_pos.x > 512 or check_pos.x < 0 or check_pos.y > 512 or check_pos.y < 0: is_valid = false
	
	## CANNOT MOVE INTO FLOW LINES
	var flow_lines = get_parent().get_parent().flow_dict
	for k in flow_lines.keys():
		var array = flow_lines.get(k)
		for i in array:
			if check_pos == i: is_valid = false
	
	## CANNOT MOVE INTO OTHER OBSTACLES
	for o in get_parent().get_children():
		if o.global_position == global_position: continue
		if o.global_position == check_pos: is_valid = false
	
	## MOVE IF VALID. STOP AND ROTATE IF NOT. 
	if not is_valid:
		check_pos = global_position
		facing = facing * -1
		global_rotation += PI
	global_position = check_pos
