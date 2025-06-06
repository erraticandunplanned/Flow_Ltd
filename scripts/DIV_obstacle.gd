@tool
extends Node2D

## DIV OBSTACLE
## the DIV obstacle move in a straight line until it hits a wall, reverses direction, then moves again
## if a DIV obstacle collides with a flow node or goal node, it destroys it
## the DIV obstacle is a pair of triangles

@onready var mesh_node : MeshInstance2D = $shape

var next_pos = Vector2.ZERO
var facing = Vector2.UP

signal collision(pos)

func _ready():
	var meshdata = []
	meshdata.resize(ArrayMesh.ARRAY_MAX)
	
	meshdata[ArrayMesh.ARRAY_VERTEX] = PackedVector2Array(
		[
			Vector2(-28,0),
			Vector2(28,0),
			Vector2(0,-28),
			Vector2(-28,0),
			Vector2(28,0),
			Vector2(0,28)
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
			Color.HOT_PINK,
			Color.HOT_PINK,
			Color.HOT_PINK,
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE,
			Color.PALE_TURQUOISE
		]
	)
	
	mesh_node.mesh = ArrayMesh.new()
	mesh_node.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshdata)
	
	var world = get_parent().get_parent()
	world.connect("clock_update", _on_clock_update)

func rotation_setup(dir : Vector2):
	facing = dir
	var angle = dir.angle() + PI/2
	rotate(angle)

func _on_clock_update(_t):
	## CHECK FOR VALID POSITION
	var check_pos = global_position + ( facing * 64 )
	var is_valid = true
	
	## CANNOT GO OUTSIDE THE GRID
	if check_pos.x > (Global.MAP_TILE_SIZE.x * Global.MAP_MAX_SIZE.x) or check_pos.x < 0 or check_pos.y > (Global.MAP_TILE_SIZE.y * Global.MAP_MAX_SIZE.y) or check_pos.y < 0: is_valid = false
	
	## CANNOT MOVE INTO FLOW LINES
	var flow_lines = get_parent().get_parent().flow_dict
	for k in flow_lines.keys():
		var array = flow_lines.get(k)
		for i in array:
			if check_pos == i: is_valid = false
		
		## HOWEVER, DESTROYS FLOW NODES ON CONTACT
		if check_pos == array.back():
			flow_lines.erase(k)
			var canvas = get_parent().get_parent().find_child("draw_canvas")
			canvas.update_flow(flow_lines)
			emit_signal("collision", check_pos)
			is_valid = true
	
	## DESTROYS FLOW GOALS
	var goal_locations = get_parent().get_parent().goal_dict
	for k in goal_locations.keys():
		var location = goal_locations.get(k)
		if check_pos == location: 
			goal_locations.erase(k)
			var canvas = get_parent().get_parent().find_child("draw_canvas")
			canvas.update_goals(goal_locations)
			emit_signal("collision", check_pos)
			is_valid = true
	
	## CANNOT MOVE INTO OTHER OBSTACLES
	for o in get_parent().get_children():
		if o.global_position == check_pos: is_valid = false
		
		## IF TWO OBSTACLES MOVE INTO THE SAME SPOT IN A SINGLE TURN, BOTH ARE DESTROYED
		if o.global_position == next_pos: 
			emit_signal("collision", next_pos)
			queue_free()
			o.queue_free()
	
	## MOVE IF VALID. STOP AND ROTATE IF NOT. 
	if not is_valid:
		check_pos = global_position
		facing = facing * -1
		global_rotation += PI
	global_position = check_pos
	
	next_pos = global_position + ( facing * 64 )
	for o in get_parent().get_children():
		if o.global_position == next_pos: next_pos = Vector2.ZERO
