extends Area2D
class_name Interactable

#Señal para otros sistemas
signal interacted(who)

func _ready() -> void:
	#Conectamos la colision a nuestra propia funcion
	body_entered.connect(_on_body_entered)

func _on_body_entered(body : Node2D) -> void:
	print("_on_body_entered")
	#Solo se interactua con el jugador por ahora
	if body.is_in_group("Player"):
		_on_interact(body)

	#_play_interaction_animation()
#Se sobreescribe en las clases hijas para diferenciar
#las interacciones
func _on_interact(player : Node2D) -> void:
	print("_on_interact")
	emit_signal("interacted", player)
	_on_interacted(player)
	#_play_interaction_animation()
	
func _on_interacted(player: Node2D) -> void:
	pass
	
#Ejecutar la animacion de interaccion
func _play_interaction_animation() -> void:
	# Se ejectua la animacion de destruccion
	# cuando acaba se destruye el objeto
	
	# Animación de destrucción
	print("Aqui va la animación de interacción")
	var tween := create_tween() # Crea una animación sin necesidad de un nodo AnimationPlayer
	tween.tween_property(self, "scale", Vector2.ZERO, 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "modulate:a", 0.0, 0.3)  # desvanece el sprite
	 #Borramos el nodo
	tween.finished.connect(queue_free) # Cuando acabe borramos el nodo del arbol
