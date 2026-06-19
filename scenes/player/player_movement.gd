extends Node2D
 
@export var speed = 400

@export var papa: CharacterBody2D;

func get_input():
	look_at(get_global_mouse_position())
	papa.velocity = transform.x * Input.get_axis("forward", "backwards") * speed
	print('input')
	print(papa)
func _physics_process(_delta):
	get_input()
	papa.move_and_slide()
	print(papa.velocity)
