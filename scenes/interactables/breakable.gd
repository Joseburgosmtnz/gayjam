# Nodo que al interaccionar con el se destruye
# si posees una mutacion determinada

extends Interactable
class_name Breakable

# Se asigna una mutacion para que se destruya
@export var mutation_counter : Mutation

func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el breakable")
	if mutation_counter in player.mutations:
		print("El jugador tiene la mutación correcta, iniciamos interacción")
		_play_interaction_animation()
	
func _play_interaction_animation() -> void:
	# Se ejectua la animacion de destruccion
	# cuando acaba se destruye el objeto
	
	# Animación de destrucción
	print("Aqui va la animación de interacción")
	#var tween := create_tween() # Crea una animación sin necesidad de un nodo AnimationPlayer
	#tween.tween_property(self, "scale", Vector2.ZERO, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	#tween.tween_property(self, "modulate:a", 0.0, 0.3)  # desvanece el sprite
	# Borramos el nodo
	#tween.finished.connect(queue_free) # Cuando acabe borramos el nodo del arbol
	queue_free()
