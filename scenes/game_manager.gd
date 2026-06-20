extends Node


func register_breakable(breakable: Interactable) -> void:
	breakable.interacted.connect(_on_breakable_interacted)

func restart() -> void:
	get_tree().reload_current_scene()

func _on_breakable_interacted(_player: Node2D) -> void:
	restart()
