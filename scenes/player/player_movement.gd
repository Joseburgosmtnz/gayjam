extends Node2D

class_name CharacterMovement;

var step: int;
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and event.pressed:
		var papa = get_parent();
		if event.keycode == KEY_UP:
			papa.position.y -= step
		if event.keycode == KEY_DOWN:
			papa.position.y += step
		if event.keycode == KEY_LEFT:
			papa.position.x -= step
		if event.keycode == KEY_RIGHT:
			papa.position.x += step

func changeStep (newStep : int) :
	step = newStep;
