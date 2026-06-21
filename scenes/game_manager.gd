extends Node

var ganador: BreakableGanar


func restart() -> void:
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func ganar():
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")
