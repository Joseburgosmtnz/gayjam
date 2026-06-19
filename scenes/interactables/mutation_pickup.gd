extends Interactable

class_name MutationPickUp

#Asignamos una mutacion ya creada
@export var mutation : Mutation

func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el pickup")
	print("El jugador adquiere la mutación")
	player.mutations.append(mutation)
	_play_interaction_animation()
