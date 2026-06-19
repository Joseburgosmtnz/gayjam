extends Node2D
 
@export var speed = 400

@export var papa: CharacterBody2D;

var target = position

func _input(event):
	# Use is_action_pressed to only accept single taps as input instead of mouse drags.
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	papa.velocity = papa.position.direction_to(target) * speed
	# look_at(target)
	if papa.position.distance_to(target) > 10:
		papa.move_and_slide()
