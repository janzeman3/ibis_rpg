extends Area2D

# verejne vlastnosti monstra
export var XP = 10 # ziskane zkusenosti pri zabiti
export var HP = 10 # zivoty
export var UC = 5  # utocne cislo
export var OC = 5  # obranne cislo

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
