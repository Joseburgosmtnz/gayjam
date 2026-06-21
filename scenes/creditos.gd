extends Node


func _reset():
	GameManager.restart()


func _on_button_pressed() -> void:
	_reset() # Replace with function body.
