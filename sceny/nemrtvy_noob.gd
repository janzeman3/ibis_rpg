extends Area2D

# verejne vlastnosti monstra
export var XP = 10 # ziskane zkusenosti pri zabiti
export var HP = 10 # zivoty
export var UC = 5  # utocne cislo
export var OC = 5  # obranne cislo
var rychlost = 150
var smer = Vector2(0, 0)

# interni promenne
onready var Hlavni = get_node("/root/Hlavni") # odkaz na hlavni scenu

# pri kolizi volama centralni zpracovani kolizi
func _on_nemrtvy_noob_area_entered(area):
	Hlavni.kolizeSMonstrem(self, area)

func _process(delta):
	# pokud nemas zivoty zemri a odevzdej XP
	if HP <= 0:
		Hlavni.pridejXP(XP)
		queue_free()

	# pohyb
	smer.x += (randf()-0.5) * rychlost
	smer.y += (randf()-0.5) * rychlost
	smer = smer.normalized() * rychlost
	var kamChci = position + smer * delta
	if Hlavni.jeTamVolno(kamChci):
		position = kamChci
	
	$Animace.play()
	
	if abs(smer.x) > abs(smer.y):
		if smer.x > 0:
			$Animace.animation = "doprava"
		else:
			$Animace.animation = "doleva"
	else:
		if smer.y > 0:
			$Animace.animation = "dolu"
		else:
			$Animace.animation = "nahoru"
