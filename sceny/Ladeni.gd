extends GridContainer

enum charaktery{
  Lucistnik,
  Mag
}

func _process(delta):
	$Pozice.text = str(get_node("../Hrac/Lucistnik").position)

func _on_Lucistnik_pressed():
	var hrac = get_node("../Hrac")
	hrac.setTyp(charaktery.Lucistnik)
	hrac.setPozice(Vector2(32, 10*32-16))

func _on_Mag_pressed():
	var hrac = get_node("../Hrac")
	hrac.setTyp(charaktery.Mag)
	hrac.setPozice(Vector2(32, 10*32-16))
