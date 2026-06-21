extends Node


func register_breakable(breakable: Interactable) -> void:
	breakable.interacted.connect(_on_breakable_interacted)

func restart() -> void:
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_breakable_interacted(_player: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")
