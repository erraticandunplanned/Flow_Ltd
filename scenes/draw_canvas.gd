extends Node2D

var linestart = Vector2.ZERO
var lineend = Vector2.ZERO
var linecolor = Color.WHITE
var linewidth = 32.0

func _process(delta):
	queue_redraw()

func call_remote_draw(s, e, c, w):
	linestart = s
	lineend = e
	linecolor = c
	linewidth = w
	_draw()

func _draw():
	draw_line(linestart, lineend, linecolor, linewidth, false)
