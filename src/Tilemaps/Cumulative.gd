extends TileMap

export (Color, RGBA) var red
export (Color, RGBA) var green

var current_color = green
var tile
var build_ready = false
var in_menu = false

onready var sprite = $Sprite

func _ready():
	sprite.visible = false

func _physics_process(delta):
	if in_menu == true || Vars.rotate == true:
		sprite.visible = true
		var mouse_pos = get_global_mouse_position()
		tile = world_to_map(mouse_pos)
		sprite.position = map_to_world(tile)
			
		if Vars.rotate == false && in_menu == true:
			if get_cellv(tile) == 4:
				Vars.buildSelection = true
				current_color = green
				build_ready = true
			else:
				Vars.buildSelection = false
				current_color = red
				build_ready = false
		elif Vars.rotate == true:
			if get_cellv(tile) == 4:
				Vars.rotateSelection = false
				current_color = red
			else:
				Vars.rotateSelection = true
				current_color = green
		
		sprite.material.set_shader_param('current_color', current_color)
	else:
		sprite.visible = false
