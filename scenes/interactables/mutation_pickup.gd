extends Interactable

class_name MutationPickUp

#Asignamos una mutacion ya creada
@export var mutation_resource : Mutation
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var mutation_scene := preload("res://scenes/mutations/mutation.tscn")

var pierna_posible_positions = [
	{"rotation":0, "position":Vector2(85, 85), "scale":Vector2(1, 1)},
	{"rotation":0, "position":Vector2(-85, 85), "scale":Vector2(-1, 1)},
	{"rotation":0, "position":Vector2(85, -85), "scale":Vector2(1, -1)},
	{"rotation":0, "position":Vector2(-85, -85), "scale":Vector2(-1, -1)},
]

var ojo_posible_positions = [
	{"rotation":0, "position":Vector2(0, -110)},
	{"rotation":90, "position":Vector2(110, 0)},
	{"rotation":180, "position":Vector2(0, 110)},
	{"rotation":270, "position":Vector2(-110, 0)},
]

var nariz_posible_positions = [
	{"rotation":10, "position":Vector2(0, 0)},
	#{"rotation":90, "position":Vector2(110, 0)},
	#{"rotation":180, "position":Vector2(0, 110)},
	#{"rotation":270, "position":Vector2(-110, 0)},
]

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
	
	if mutation_resource.mutation_name == "Pierna":
		var posicion_exacta = pierna_posible_positions[randi_range(0, 3)]
		print("Pierna:", posicion_exacta)
		m.rotation = deg_to_rad(posicion_exacta["rotation"])
		m.position = posicion_exacta["position"]
		
		var random_scale = randf_range(0.2, 0.8)
		m.scale = Vector2(
			random_scale*posicion_exacta["scale"][0], 
			random_scale*posicion_exacta["scale"][1]
		)
	elif mutation_resource.mutation_name == "Ojos":
		var posicion_exacta = ojo_posible_positions[randi_range(0, 3)]
		print("Ojo:", posicion_exacta)
		m.rotation = deg_to_rad(posicion_exacta["rotation"])
		m.position = posicion_exacta["position"]
		
		var random_scale = randf_range(0.3, 0.65)
		m.scale = Vector2(random_scale, random_scale)
		
	elif mutation_resource.mutation_name == "Nariz":
		var posicion_exacta = nariz_posible_positions[randi_range(0, 0)]
		print("Nariz:", posicion_exacta)
		m.rotation = deg_to_rad(posicion_exacta["rotation"])
		m.position = posicion_exacta["position"]
		
		var random_scale = randf_range(0.2, 0.8)
		m.scale = Vector2(random_scale, random_scale)
	
	player.add_child(m)
	
	_play_interaction_animation()
