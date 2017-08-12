extends Node

#Take the main values for the first level
var resources = 10000
var troops    = 88
var moral     = 11

var day       = 1

var enemyR    = 15000
var enemyT    = 300
var enemyM    = 89

var enemy_resupply

#booleans to know the end of the round and turns
var playerHasMove = false
var enemyHasMove = false

#use to increase the probability to die starving and to get down the moral
var days_starving = 0
var enemy_days_starving = 0

var hunger_moralDown
var hunger_troopsDown

#use for rationing resources
var rationing = false

#days that soldiers will take to come back with resources 
var daysToComeBack

func _ready():
	set_process_input(true)

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

#moral decrement by hunger, take in count moral and days_starving
func hunger_moralDown(any_resources , any_troops , any_moral):
	if(any_resources > 0):
		hunger_moralDown = int(round((pow(10,(any_moral/100))) * pow(1.1,days_starving) * randF() * (any_troops/any_resources)) )
	return hunger_moralDown

#troops decrement by hunger, take in count troops and days starving
func hunger_troopsDown(any_resources , any_troops):
	if(any_resources > 0):
		hunger_troopsDown = int(round(((pow(10,days_starving/10) * randF()) * 0.1) * ((any_troops/30)*randF() ) * (any_troops/any_resources)))
	else:
		hunger_troopsDown = int(round(((pow(10,days_starving/10) * randF()) * 0.1) * ((any_troops/30)*randF() )))
	return hunger_troopsDown

#enemies recive supplies once per week
func enemy_resupply():
	enemy_resupply = (log(enemyT+1) * 70) / ( log(enemyR * 0.1)/log(10) )

#random factor between 0 and 2, most probably 1 less prob 0 or 2
func randF():
	return (2 * ( ( (randf(0,1)) + (randf(0,1)) + (randf(0,1)) ) / 3) )

#in case any value is under zero, this function put them to 0, because any value can go under 0 (since moral is a %)
func valuesOverZ():
	if(moral < 0):
		moral = 0
	if(troops < 0):
		troops = 0
	if(resources < troops):
		resources=0
	if(enemyM < 0):
		enemyM = 0
	if(enemyT < 0):
		enemyT = 0
	if(enemyR < enemyT):
		enemyR=0

#calcs the days soldiers will take to come back
func daysToComeBack():
	daysToComeBack = int(round((log(enemyT) * randF() * 2 )+ 1))
	return daysToComeBack
##When a day ends: incrises day, and take resources taking in count troops, if 
##	there is not enough resources moral will go down and soldiers may die (and same for enemy)
func new_day ():
	if(playerHasMove and enemyHasMove):
		day += 1
		if(rationing):
			resources = resources - (troops/4)
			moral -= int(round((hunger_moralDown(resources , troops , moral) * randF() * 0.25) ))
			if(moral<0):
				moral = 0
		elif(resources - troops >= 0):
			resources -= troops
			days_starving = 0
			
		else:
			days_starving += 1
			moral -= hunger_moralDown(resources , troops , moral)
			troops -= hunger_troopsDown(resources , troops)
			resources = 0
		if (enemyR - enemyT >= 0):
			enemyR -= enemyT
			enemy_days_starving = 0
			print("this 'If' works propertly")
		else:
			enemy_days_starving += 1
			enemyM -= hunger_moralDown(enemyR , enemyT , enemyM)
			enemyT -= hunger_troopsDown(enemyR , enemyT)
		valuesOverZ()

func ask_for_resources():