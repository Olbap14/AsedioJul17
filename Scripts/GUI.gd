extends Node2D


func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):
	var label_recursos = get_node("resources")
	var label_tropas = get_node("troops")
	var label_moral = get_node("moral")
	
	var value_recursos = get_tree().get_root().get_node("global").resources
	var value_tropas = get_tree().get_root().get_node("Global").troops
	var value_moral = get_tree().get_root().get_node("Global").moral
	var value_day = get_tree().get_root().get_node("Global").day
	label_recursos.set_text("Resources: " + str(value_recursos))
	label_tropas.set_text("Toops: " + str(value_tropas))
	label_moral.set_text("Moral: " + str(value_moral))
