# Nodo que al interaccionar con el se destruye
# si posees una mutacion determinada

extends Interactable
class_name BreakableGanar

# Se asigna una mutacion para que se destruya

func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el breakable")
#	Lista de nombres de mutaciones del player
	var mutation_names := []
	print(player.mutations)
	for m in player.mutations: 
		print(m)
		mutation_names.append(m.mutation_name)
		
	if mutation_names.size() > 0:
		print("El jugador tiene todas las mutaciones")
		_play_interaction_animation()
		GameManager.ganar()
	
