extends Control

onready var woodLabel = $Panel/HBoxContainer/MainMaterials/WoodLabel
onready var wheatLabel = $Panel/HBoxContainer/MainMaterials/WheatLabel
onready var stoneLabel = $Panel/HBoxContainer/MainMaterials/StoneLabel
onready var arrowsLabel = $Panel/HBoxContainer/MainMaterials/ArrowsLabel

onready var population = $Panel/HBoxContainer/Stats/PopulationLabel

func _ready():
	Vars.connect("updateLabels", self, "updateLabels")
	updateLabels()
	
func updateLabels():
	population.text = "Population: " + str(Vars.population)
	
	woodLabel.text = "Wood: " + str(Vars.wood)
	wheatLabel.text = "Wheat: " + str(Vars.wheat)
	stoneLabel.text = "Stone: " + str(Vars.stone)
	arrowsLabel.text = "Arrows: " + str(Vars.arrows)


func _on_Pause_pressed():
	pass # Replace with function body.
