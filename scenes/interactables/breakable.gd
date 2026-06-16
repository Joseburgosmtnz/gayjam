#Nodo que al interaccionar con el se destruye
#si posees una mutacion determinada

extends Interactable
class_name Breakable

#Se asigna una mutacion para que se destruya
@export var mutation_counter : Mutation

func _on_interact(player : Node2D) -> void:
	#Comprobamos que el jugador posea la mutacion counter
		#si la tiene ejecutamos la animacion de destruccion
	pass
func _play_interaction_animation() -> void:
	#se ejectua la animacion de destruccion
	#cuando acaba se destruye el objeto
	pass
