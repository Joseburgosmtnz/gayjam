extends Interactable

class_name MutationPickUp

#Asignamos una mutacion ya creada
@export var mutation_resource : Mutation
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var mutation_scene := preload("res://scenes/mutations/mutation.tscn")

func _ready() -> void:
	animated_sprite_2d.sprite_frames = mutation_resource.sprite_frames
	animated_sprite_2d.play("default")

func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el pickup")
	print("El jugador adquiere la mutación")
#	Comprobar que hay mutation_resource
	player.mutations.append(mutation_resource)
	var m = mutation_scene.instantiate()
	m.get_node("AnimatedSprite2D").sprite_frames = mutation_resource.sprite_frames
	
	m.get_node("AnimatedSprite2D").play("default")
	m.rotation = randf_range(0, 360)
	var random_scale = randf_range(0.2, 0.8)
	m.scale = Vector2(random_scale, random_scale)
	m.position = Vector2(randf_range(-75, 75), randf_range(-75, 75))
	player.add_child(m)
	
	_play_interaction_animation()
