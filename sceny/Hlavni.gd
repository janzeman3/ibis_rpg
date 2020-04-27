extends Node

func _ready():
	$Inventar.hide()
	$Postava.hide()

	$Hrac.position.x = 32
	$Hrac.position.y = 10*32-16
	$Hrac.show()

func _on_Ovladani_oteviramInventar():
	$Ovladani.hide()
	$Inventar.show()

func _on_Inventar_zaviramInventar():
	$Ovladani.show()

func _on_Postava_zaviramPostavu():
	$Ovladani.show()

func _on_Ovladani_oteviramPostavu():
	$Ovladani.hide()
	$Postava.show()

func _process(delta):
	var kamChceHrac = $Hrac.kamChciJit(delta)
	
	if $Mapy.jeVolno(kamChceHrac):
		$Hrac.position = kamChceHrac
	
	$Ladeni.setPozice($Hrac.position)

