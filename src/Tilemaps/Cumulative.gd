extends TileMap

export (Color, RGBA) var red
export (Color, RGBA) var green

var current_color = green
var tile
var build_ready = false
var in_menu = false


func _physics_process(delta):
	if in_menu:
		$Sprite.visible = true
		var mouse_pos = get_global_mouse_position()
		tile = world_to_map(mouse_pos)
		$Sprite.position = map_to_world(tile)
		
		if get_cellv(tile) == 4:
			current_color = green
			build_ready = true
		else:
			current_color = red
			build_ready = false
		
		$Sprite.material.set_shader_param('current_color', current_color)
	else:
		$Sprite.visible = false
