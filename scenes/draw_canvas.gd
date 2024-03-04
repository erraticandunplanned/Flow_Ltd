extends Node2D

@onready var grid_script = preload("res://scripts/test_grid.gd")

var lines = []
var circles = []
var flow_nodes = []

func _process(delta):
	queue_redraw()

func _draw():
	for i in lines:
		draw_line(i[0], i[1], i[2], 32, false)
	for j in circles:
		draw_circle(j[0], 16, j[1])
	for k in flow_nodes:
		draw_circle(k[0], 28, k[1])

func update_flow(d):
	var flow_dict = d
	flow_nodes.clear()
	for k in flow_dict.keys():
		var array = flow_dict.get(k)
		var value = array.back()
		var newflow = [value, k]
		flow_nodes.append(newflow)

func call_remote_draw(s, e, c):
	var newline = [s,e,c]
	var newcircle = [s,c]
	lines.append(newline)
	circles.append(newcircle)

func remove_previous():
	lines.remove_at(lines.size()-1)
	circles.remove_at(circles.size()-1)
