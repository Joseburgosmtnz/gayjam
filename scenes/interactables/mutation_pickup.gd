extends Interactable

class_name MutationPickUp

#Asignamos una mutacion ya creada
@export var mutation_resource : Mutation
var mutation_scene := preload("res://scenes/mutations/mutation.tscn")

func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el pickup")
	print("El jugador adquiere la mutación")
#	Comprobar que hay mutation_resource
	player.mutations.append(mutation_resource)
	
	player.add_child(mutation_scene.instantiate())
	
	_play_interaction_animation()
