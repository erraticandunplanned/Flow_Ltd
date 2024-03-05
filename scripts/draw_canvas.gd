extends Node2D

## BUG: LINES AND CIRCLES ARE CURRENTLY SHARED BY ALL NODES. UPDATE TO A DICTIONARY
var lines = []
var circles = []
var flow_nodes = []
var goals = []

var flow_dict = {}

func _process(delta):
	queue_redraw()

func _draw():
	if flow_dict == {}: return
	
	for i in lines:
		draw_line(i[0], i[1], i[2], 32, false)
	for j in circles:
		draw_circle(j[0], 16, j[1])
	for k in flow_nodes:
		draw_circle(k[0], 28, k[1])
	for g in goals:
		draw_circle(g[0], 16, g[1])

func update_goals(g):
	var goal_dict : Dictionary
	goal_dict = g
	for key_color in g.keys():
		var location = g.get(key_color)
		var new_goal = [location, key_color]
		goals.append(new_goal)

func update_flow(d):
	flow_dict = d
	flow_nodes.clear()
	lines.clear()
	circles.clear()
	
	for k in flow_dict.keys():
		var array = flow_dict.get(k)
		
		## UPDATE THE "flow_nodes" ARRAY TO CONTAIN CURRENT POSITION AND COLOR OF ALL FLOW NODES
		var value = array.back()
		var newflow = [value, k]
		flow_nodes.append(newflow)
		
		## UPDATE THE "lines" ARRAY TO CONTAIN ALL LINES
		var last = Vector2.ZERO
		for i in array:
			if last != Vector2.ZERO: 
				var newline = [last,i,k]
				lines.append(newline)
			last = i
			
			## UPDATE THE "circles" ARRAY TO CONTAIN ALL CORNERS
			var newcircle = [i,k]
			circles.append(newcircle)
