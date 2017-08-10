extends Node

#Take the main values from the first level
var resources = 10000
var troops    = 88
var moral     = 11

var day       = 1

var enemyR    = 15000
var enemyT    = 300
var enemyM    = 89

#booleans to know the end of the round and turns
var playerHasMove = false
var enemyHasMove = false

#use to increase the probability to die starving and to get down the moral
var days_starving = 0

func _ready():
	set_process_input(true)

#Values geters
func get_resources():
	return resources
func get_troops():
	return troops
func get_moral():
	return moral
func get_day():
	return day
func get_enemyR():
	return enemyR
func get_enemyT():
	return enemyT
func get_enemyM():
	return enemyM

#Values seters
func set_resources(cResources):
	resources = cResources
func set_troops(cTroops):
	troops = cTroops
func set_moral(cMoral):
	moral = cMoral
func set_day(cDay):
	day = cDay
func set_enemyR(cEnemyR):
	enemyR = cEnemyR
func set_enemyT(cEnemyT):
	enemyT = cEnemyT
func set_enemyM(cEnemyM):
	enemyM = cEnemyM


func new_day ():
	if(playerHasMove and enemyHasMove):
		set_day(day + 1)
		if(resources - troops > 0):
			set_resources(resources - troops)
		else:
			set_resources(0)
			set_moral(moral/2)
			days_starving += 1
		
		