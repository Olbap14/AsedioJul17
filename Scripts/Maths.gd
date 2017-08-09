extends Node2D

var current_resources
var current_troops
var current_moral
var current_day
var current_enemyR
var current_enemyT
var current_enemyM

func _ready():
	set_process_input(true)

func current_values(cResources,cTroops,cMoral,cDay,cEnemyR,cEnemyT,cEnemyM):
	if(current_resources == null):
		current_resources = get_parent().get_node("Levels/Lvl_1").resources
		current_troops    = get_parent().get_node("Levels/Lvl_1").troops
		current_moral     = get_parent().get_node("Levels/Lvl_1").moral
		current_day       = get_parent().get_node("Levels/Lvl_1").day
		current_enemyR    = get_parent().get_node("Levels/Lvl_1").enemyR
		current_enemyT    = get_parent().get_node("Levels/Lvl_1").enemyT
		current_enemyM    = get_parent().get_node("Levels/Lvl_1").enemyM
	else:
		current_resources = cResources
		current_troops    = cTroops
		current_moral     = cMoral
		current_day       = cDay
		current_enemyR    = cEnemyR
		current_enemyT    = cEnemyT
		current_enemyM    = cEnemyM

