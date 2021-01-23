extends Node

signal updateLabels

var buildSelection = false
var rotateSelection = false

var rotate = false

#Base/Materials
var population = 1

var wood = 0
var wheat = 0
var stone = 0
var arrows = 0
var bullets = 0

#Buildings
var smallGardens = 0

func smallGardenProduce(time):
	if smallGardens >= 1:
		yield(get_tree().create_timer(10), "timeout")
		wheat += randi()%2+1
		smallGardenProduce(time)
		emit_signal("updateLabels")
	
