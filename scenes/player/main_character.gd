extends CharacterBody2D

class_name Player

@export var mutations : Array[Mutation] = []

func _add_mutation(new_mutation : Mutation):
	mutations.append(new_mutation)
	
