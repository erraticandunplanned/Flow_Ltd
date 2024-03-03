extends Node2D

var lines = []
var circles = []

func _process(delta):
	queue_redraw()

func _draw():
	for i in lines:
		draw_line(i[0], i[1], i[2], i[3], false)
	for j in circles:
		draw_circle(j[0], j[1], j[2])

func remove_previous():
	lines.remove_at(lines.size()-1)
	circles.remove_at(circles.size()-1)

func call_remote_draw(s, e, c, w):
	var newline = [s,e,c,w]
	var newcircle = [s,w/2,c]
	lines.append(newline)
	circles.append(newcircle)
