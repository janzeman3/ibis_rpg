extends Node

enum typy_postavy{
  Lucistnik,
  Mag
}

export onready var Hrac = $Hrac
export onready var Mapy = $Mapy

func _ready():
	$Inventar.hide()
	$Postava.hide()

	$Hrac.setPozice(Vector2(32, 10*32-16))

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
		$Hrac.setPozice(kamChceHrac)
		$Mapy.hrac_zmenil_pozici(kamChceHrac)

func addToLog(ttext):
	$Log.add_item(ttext)
	$Log.select($Log.get_item_count()-1)
	$Log.ensure_current_is_visible()

func pridejXP(newXP):
	$Hrac.XP += newXP

# hazi 1K6+
func kostka():
	var padlo = randi()%6+1
	var vysledek = padlo
	while padlo == 6:
		padlo = randi()%6+1
		vysledek += padlo
	return vysledek

func utokNaHrace(monstrum):
	addToLog("Fight:")

	# utok na hrace
	var utokNaHraceVysledek = monstrum.UC + kostka() - (Hrac.OC + kostka())
	if utokNaHraceVysledek > 0:
		Hrac.HP -= utokNaHraceVysledek
		addToLog("- Zranění -" + str(utokNaHraceVysledek) + "HP")
	else:
		addToLog("- Bez zranění!")

	# utok na soupere
	var utokNaSoupere = Hrac.UC + kostka() - (monstrum.OC + kostka())
	if utokNaSoupere > 0:
		addToLog("- Zásah " + str(utokNaSoupere) + "HP")
		monstrum.HP -= utokNaSoupere
	else:
		addToLog("- Minuls")

func jeToHrac(area):
	return area==Hrac.aktivniTyp

func kolizeSMonstrem(monstrum, kolize):
	if jeToHrac(kolize):
		utokNaHrace(monstrum)
	

