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
	if Input.is_action_just_pressed('click_left'):
		if tile_index == -100 && Vars.buildSelection == true && Vars.rotate == false:
			pass
		elif Vars.rotate == true:
			var target_position = get_global_mouse_position()
			tile = current_set.world_to_map(target_position)
			var tile_i = current_set.get_cellv(tile)
			
			var tile_data = [
					current_set.is_cell_x_flipped(tile.x, tile.y),
					current_set.is_cell_y_flipped(tile.x, tile.y),
					current_set.is_cell_transposed(tile.x, tile.y)
				]

			if tile_data[0] == false && tile_data[1] == false && tile_data[2] == false:
				current_set.set_cell(tile.x, tile.y, tile_i, false, true, true) #down
			elif tile_data[0] == false && tile_data[1] == true && tile_data[2] == true:
				current_set.set_cell(tile.x, tile.y, tile_i, true, true, false) #left
			elif tile_data[0] == true && tile_data[1] == true && tile_data[2] == false:
				current_set.set_cell(tile.x, tile.y, tile_i, true, false, true) #up
			elif tile_data[0] == true && tile_data[1] == false && tile_data[2] == true:
				current_set.set_cell(tile.x, tile.y, tile_i, false, false, false) #right
				
		elif Vars.buildSelection == true:
			var target_position = get_global_mouse_position()
			tile = current_set.world_to_map(target_position)
			#has(var2str((tile/2).floor())) == false:
			#print(var2str((tile/2).floor()))
			change_tile()
	elif Input.is_action_just_pressed('toggle'):
		
		if buildMenu.visible == false:
			print("build")
			buildMenu.visible = true
			$UI/BuildMode.visible = true
			cumulative.in_menu = true
			$UI/RotateMode.visible = false
			Vars.rotate = false
		else:
			buildMenu.visible = false
			$UI/BuildMode.visible = false
			cumulative.in_menu = false
			$UI/RotateMode.visible = false
			Vars.rotate = false

		if buildMenu.visible:
			tile_index = -100
	elif Input.is_action_just_pressed('click_right') && cumulative.in_menu == true:
		var target_position = get_global_mouse_position()
		tile = current_set.world_to_map(target_position)
		#print(var2str((tile/2).floor()))
		delete_tile()
	elif Input.is_action_just_pressed('rotate'):
		if Vars.rotate == false:
			print("rotate")
			Vars.rotate = true
			$UI/RotateMode.visible = true
			buildMenu.visible = false
			$UI/BuildMode.visible = false
			cumulative.in_menu = false
		else:
			$UI/RotateMode.visible = false
			Vars.rotate = false
			buildMenu.visible = false
			$UI/BuildMode.visible = false
			cumulative.in_menu = false

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
