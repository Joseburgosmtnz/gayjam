extends Node2D
 
@export var speed = 400

@export var papa: CharacterBody2D;

var target = position
	# Use is_action_pressed to only accept single taps as input instead of mouse drags.

func _physics_process(_delta):
	if Input.is_action_pressed("click") and get_tree().current_scene.name != "Creditos":
		target = get_global_mouse_position()
		papa.velocity = papa.position.direction_to(target) * speed
		# look_at(target)
		if papa.position.distance_to(target) > 10 and get_tree().current_scene.name != "Creditos":
			papa.move_and_slide()
	
