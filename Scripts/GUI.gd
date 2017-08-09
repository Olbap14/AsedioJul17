extends Node2D


func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):
	var label_recursos
	var label_tropas
	var label_moral 
	
	
	var value_resources = get_parent().get_node("Maths").current_resources
	var value_troops    = get_parent().get_node("Maths").current_troops
	var value_moral     = get_parent().get_node("Maths").current_moral
	
	var value_day = get_parent().get_node("Maths").current_day
	
	var value_enemyR = get_parent().get_node("Maths").current_enemyR
	var value_enemyT = get_parent().get_node("Maths").current_enemyT
	var value_enemyM = get_parent().get_node("Maths").current_enemyM
	
	
	get_node("My_values/Resources").set_text("Resources: " + str(value_resources) + " days")
	#label_tropas = ("Toops: " + str(value_troops))
	#label_moral = ("Moral: " + str(value_moral))
