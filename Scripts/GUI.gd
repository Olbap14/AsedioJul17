extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):
	var label_recursos = get_node("Recursos")
	var label_tropas = get_node("Tropas")
	var label_moral = get_node("Moral")
	
	var value_recursos = get_tree().get_root().get_node("global").recursos
	var value_tropas = get_tree().get_root().get_node("global").tropas
	var value_moral = get_tree().get_root().get_node("global").moral
	label_recursos.set_text("Recursos: " + str(value_recursos))
	label_tropas.set_text("Tropas: " + str(value_tropas))
	label_moral.set_text("Moral: " + str(value_moral))
