extends Node2D
#Strings variables
var label_recursos
var label_tropas
var label_moral 

var lavel_day


#boolean for chose language
var isEnglish = true


func _ready():
	set_process(true)


func _process(delta):
	var value_resources = global.resources
	var value_troops    = global.troops
	var value_moral     = global.moral
	
	var value_day = global.day
	
	var value_enemyR = global.enemyR
	var value_enemyT = global.enemyT
	var value_enemyM = global.enemyM
	
	get_node("My_values/Resources").set_text("Supplies: " + str(value_resources/value_troops))
	get_node("My_values/Troops").set_text("Troops: " + str(value_troops))
	get_node("My_values/Moral").set_text("Moral: " + str(value_moral))
	

