extends Control

onready var GameSave : Node = $GameSave

func _on_Save_pressed():
	GameSave.save(1)

func _on_Load_pressed():
	GameSave.load(1)
