extends Control

@onready var label: Label = $Label

func _ready() -> void:
	label.text = "Score: " + str(Global.score)

#Restart Button
func _on_button_pressed() -> void:
	Global.score = 0
	get_tree().change_scene_to_file("res://Scenes/main.tscn") # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.
