# Nodo que al interaccionar con el se destruye
# si posees una mutacion determinada

extends Interactable
class_name Breakable
@onready var mutation_required_sprite: Sprite2D = $Pompa/MutationRequiredSprite

# Se asigna una mutacion para que se destruya
@export var mutation_required : Mutation

func _ready() -> void:
	_assign_mutation_required_sprite()


func _on_interacted(player : Node2D) -> void:
	# Comprobamos que el jugador posea la mutacion counter
	# si la tiene ejecutamos la animacion de destruccion
	print("El jugador ha interaccionado con el breakable")
#	Lista de nombres de mutaciones del player
	var mutation_names : Array 
	print(player.mutations)
	for m in player.mutations: 
		print(m)
		mutation_names.append(m.mutation_name)
		
	if mutation_required.mutation_name in mutation_names:
		print("El jugador tiene la mutación correcta, iniciamos interacción")
		_play_interaction_animation()

func _assign_mutation_required_sprite():
	mutation_required_sprite.texture = mutation_required.texture
	
