extends Node

signal time_passed(time)

#time variables. These can be loaded in from the save game.
var minutes = 0
var hours = 0
var days = 0

func _ready():
	#When the game opens, it will automatically start the clock
	time()

func time():
	yield(get_tree().create_timer(2), "timeout")
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
	time()


#func _on_time_passed(time):
#	print("Days" + str(time[0]))
#	print("Hours" + str(time[1]))
#	print("Minutes" + str(time[2]))
	

