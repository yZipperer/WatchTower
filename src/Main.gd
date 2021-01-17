extends Node2D


#onready var logWalls = $LogWalls
onready var cumulative = $Cumulative
onready var buildMenu = $"Build System UI"

func _ready():
	var tiles = cumulative.get_used_cells()
	var mouse_pos = get_viewport().get_mouse_position()
	
	
var tile = null
var tile_index = -100

var tile_name
onready var current_set = cumulative
func _unhandled_input(event):
	if Input.is_action_just_pressed('click_left') && cumulative.in_menu == true:
		if tile_index == -100 && Vars.buildSelection == true:
			pass
		elif Vars.rotate == true:
			var target_position = get_global_mouse_position()
			tile = current_set.world_to_map(target_position)
			var tile_i = current_set.get_cellv(tile)
			current_set.set_cell(tile.x, tile.y, tile_i, true, false, true)
		elif Vars.buildSelection == true:
			var target_position = get_global_mouse_position()
			tile = current_set.world_to_map(target_position)
			#has(var2str((tile/2).floor())) == false:
			#print(var2str((tile/2).floor()))
			change_tile()
	elif Input.is_action_just_pressed('toggle'):
		cumulative.in_menu = !cumulative.in_menu
		buildMenu.visible = !buildMenu.visible
		if buildMenu.visible:
			tile_index = -100
	elif Input.is_action_just_pressed('click_right') && cumulative.in_menu == true:
		var target_position = get_global_mouse_position()
		tile = current_set.world_to_map(target_position)
		#print(var2str((tile/2).floor()))
		delete_tile()
	elif Input.is_action_just_pressed('rotate') && cumulative.in_menu == true:
		Vars.rotate = true
	#if Input.is_action_just_pressed('grass'):
	#	tile_index = 12
	#elif Input.is_action_just_pressed('concrete'):
	#	print('pressed')
	#	tile_index = 11
	#	
func change_tile():
	current_set.set_cell(tile.floor().x, tile.floor().y, tile_index)
func delete_tile():
	cumulative.set_cell(tile.floor().x, tile.floor().y, -1)
	current_set.set_cell(tile.floor().x, tile.floor().y, 4)
	#print((tile/2).floor())
	#print(Data.game_data['Tiles']['Infrastructure'][ctile]['Positions'])
	print('match')





func _on_Wall_Straight_pressed():
	current_set = cumulative
	tile_index = 8
