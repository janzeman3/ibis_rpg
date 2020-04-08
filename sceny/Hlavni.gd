extends Node

func _ready():
	$Inventar.hide()
	$Postava.hide()
	$Timer.start()

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
	var kamChceHrac = $Hrac.vratSmerPohybu(delta)
	
	var Vect1 = Vector2(0,60)
	var Vect2 = Vector2(60,0)
	var Vect3 = Vector2(60,60)

	if $Mapa.jeVolno(kamChceHrac) && $Mapa.jeVolno(kamChceHrac+Vect1) && $Mapa.jeVolno(kamChceHrac+Vect2) && $Mapa.jeVolno(kamChceHrac+Vect3):
		$Hrac.position = kamChceHrac
	
	#position.x = clamp(position.x, 0, velikostOkna.x)
	#position.y = clamp(position.y, 0, velikostOkna.y)	



func _on_Timer_timeout():
	$Mapa.set_cell(5,5,1)
