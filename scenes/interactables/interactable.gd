extends Area2D
class_name Interactable

#Señal para otros sistemas
signal interacted(who)

func _ready() -> void:
	#Conectamos la colision a nuestra propia funcion
	body_entered.connect(_on_body_entered)

func _on_body_entered(body : Node2D) -> void:
	#Solo se interactua con el jugador por ahora
	if body.is_in_group("Player"):
		_on_interact(body)

#Esta funcion la sobreescriben las clases hijas para diferenciar
#las interacciones
func _on_interact(player : Node2D) -> void:
	emit_signal("interacted", player)
	_play_interaction_animation()
	
#Aqui se ejecuta una animacion comun aunque tambien se puede
#sobreescribir
func _play_interaction_animation() -> void:
	pass
