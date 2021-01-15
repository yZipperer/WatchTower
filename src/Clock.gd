extends Node

signal time_passed(time)

#time variables. These can be loaded in from the save game.
var minutes = 0
var hours = 0
var days = 0

var pause = false

#var prev_speed_control = 2
var speed_control = 2 #setget set_speed_control

func _ready():
	#When the game opens, it will automatically start the clock
	time(speed_control)

func time(speed):
	#if pause == true:
	#	return
	#elif prev_speed_control != speed_control:
	#	prev_speed_control = speed_control
	#	return
	#else:
		#print(speed)
	yield(get_tree().create_timer(speed), "timeout")
			#After every 2 seconds, the below code is executed
			#It first adds 10 to the minutes
			#Then, it checks to see if minutes are more than 60 and if hours are more than 24
	minutes += 10
	if minutes >= 60:
		minutes = 0
		hours+=1
		if hours >= 24:
			hours = 0
			days+=1
		
		#Creates an array with all the variables in it so you can easily access them
	var time = [days, hours, minutes]
		#Signal is emitted, with the time variables passed. The entire is called again
	emit_signal("time_passed", time)
		
	time(speed_control)

#func set_speed_control(value):
#	prev_speed_control = speed_control
#	speed_control = value
#	print(prev_speed_control)
#	print(speed_control)
#	time(speed_control)
#func _on_time_passed(time):
#	print("Days" + str(time[0]))
#	print("Hours" + str(time[1]))
#	print("Minutes" + str(time[2]))
	

