extends Node2D


onready var logWalls = $LogWalls
onready var buildMenu = $"Build System UI"

func _ready():
	var tiles = logWalls.get_used_cells()
	var mouse_pos = get_viewport().get_mouse_position()
	
	
var tile = null
var tile_index = 0

var tile_name
onready var current_set = logWalls
func _unhandled_input(event):
	if Input.is_action_just_pressed('click_left'):
		var target_position = get_global_mouse_position()
		tile = current_set.world_to_map(target_position)
		print(tile)
		#has(var2str((tile/2).floor())) == false:
		#print(var2str((tile/2).floor()))
		change_tile()
	elif Input.is_action_just_pressed('toggle'):
		buildMenu.visible = !buildMenu.visible
	elif Input.is_action_just_pressed('click_right'):
		var target_position = get_global_mouse_position()
		tile = current_set.world_to_map(target_position)
		#print(var2str((tile/2).floor()))
		delete_tile()
	#if Input.is_action_just_pressed('grass'):
	#	tile_index = 12
	#elif Input.is_action_just_pressed('concrete'):
	#	print('pressed')
	#	tile_index = 11
	#	
func change_tile():
	current_set.set_cell(tile.floor().x, tile.floor().y, tile_index)
func delete_tile():
	logWalls.set_cell(tile.floor().x, tile.floor().y, -1)
	#print((tile/2).floor())
	#print(Data.game_data['Tiles']['Infrastructure'][ctile]['Positions'])
	print('match')





func _on_Wall_Straight_pressed():
	current_set = logWalls
	tile_index = 0
