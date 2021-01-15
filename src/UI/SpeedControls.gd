extends GridContainer

onready var pause = $Pause
onready var slow = $Slow
onready var normal = $Normal
onready var fast = $Fast



func _on_Fast_pressed():
	pass
	#Clock.pause = false
	#fast.disabled = true
	#pause.disabled = false
	#normal.disabled = false
	#slow.disabled = false
	#Clock.speed_control = 1


func _on_Normal_pressed():
	pass
	#Clock.pause = false
	#fast.disabled = false
	#pause.disabled = false
	#normal.disabled = true
	#slow.disabled = false
	#Clock.speed_control = 2


func _on_Pause_pressed():
	pass
	#Clock.pause = true
	#fast.disabled = false
	#pause.disabled = true
	#normal.disabled = false
	#slow.disabled = false


func _on_Slow_pressed():
	pass
	#Clock.pause = false
	#fast.disabled = false
	#pause.disabled = false
	#normal.disabled = false
	#slow.disabled = true
	#Clock.speed_control = 5
