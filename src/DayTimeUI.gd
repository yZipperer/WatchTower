extends VBoxContainer

onready var dayLabel = $Day
onready var timeLabel = $Time

func _ready():
	Clock.connect("time_passed", self, "time_passed")
	
func time_passed(time):
	dayLabel.text = "Day " + str(time[0]) + "  "
	timeLabel.text = get_formatted_time(time)
	
func get_formatted_time(time):
	var formatted_time = ""
	if time[1] < 10:
		formatted_time += "0" + str(time[1]) + ":"
	else:
		formatted_time += str(time[1]) + ":"
	if time[2] == 0:
		formatted_time += str(time[2]) + "0"
	else:
		formatted_time += str(time[2])
		
	print(formatted_time)
	return formatted_time
	
