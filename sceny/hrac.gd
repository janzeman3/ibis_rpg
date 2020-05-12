extends Node2D

enum charaktery{
  Lucistnik,
  Mag
}

export var rychlost = 400  # How fast the player will move (pixels/sec).
export var typ = charaktery.Lucistnik

# vlastnosti postavy
export var UC = 10 # utocne cislo (melo by se nejak pocitat)
export var OC = 10 # obranne cislo (melo by se nejak pocitat)
export var XP = 0 # zkusenosti
export var HP = 100 # zivoty
export var maxHP = 100 # zivoty

var velikostOkna  # Size of the game window.
export onready var aktivniTyp = get_node("Lucistnik")

func _ready():
	velikostOkna = get_viewport_rect().size
	aktivniTyp.visible = true

func kamChciJit(delta):
	var smerPohybu = Vector2()  # The player's movement vector.
	var novaPozice = Vector2() 
	var animace = aktivniTyp.get_node("AnimatedSprite")
	
	if Input.is_action_pressed("ui_right"):
		smerPohybu.x += 1
		animace.animation = "doprava"
	if Input.is_action_pressed("ui_left"):
		smerPohybu.x -= 1
		animace.animation = "doleva"
	if Input.is_action_pressed("ui_down"):
		smerPohybu.y += 1
		animace.animation = "dolu"
	if Input.is_action_pressed("ui_up"):
		smerPohybu.y -= 1
		animace.animation = "nahoru"
	if smerPohybu.length() > 0:
		smerPohybu = smerPohybu.normalized() * rychlost
		animace.play()
	else:
		animace.stop()

	novaPozice = aktivniTyp.position + smerPohybu * delta

	novaPozice.x = clamp(novaPozice.x, 0, velikostOkna.x)
	novaPozice.y = clamp(novaPozice.y, 0, velikostOkna.y)

	return novaPozice

func setPozice(pozice):
	aktivniTyp.position = pozice

func getPozice():
	return aktivniTyp.position

func zmenAktivniTyp(novyTyp):
	if novyTyp == charaktery.Lucistnik:
		aktivniTyp = get_node("Lucistnik")
	elif novyTyp == charaktery.Mag:
		aktivniTyp = get_node("Mag")

func vsechnoSkryj():
	$Lucistnik.visible = false
	$Mag.visible = false

func setTyp(co):
	vsechnoSkryj()
	zmenAktivniTyp(co)
	aktivniTyp.visible = true

func kostka():
	var padlo = randi()%6+1
	var vysledek = padlo
	while padlo == 6:
		padlo = randi()%6+1
		vysledek += padlo
	return vysledek

func boj(souperUC, souperOC):
	get_node("/root/Hlavni").addToLog("Fight:")

	# utok na hrace
	var utokNaHrace = souperUC + kostka() - (OC + kostka())
	if utokNaHrace > 0:
		HP = HP - utokNaHrace
		get_node("/root/Hlavni").addToLog("- Zranění -" + str(utokNaHrace) + "HP")
	else:
		get_node("/root/Hlavni").addToLog("- Bez zranění!")

	# utok na soupere
	var utokNaSoupere = UC + kostka() - (souperOC + kostka())
	if utokNaSoupere > 0:
		get_node("/root/Hlavni").addToLog("- Zásah " + str(utokNaSoupere) + "HP")
		return utokNaSoupere
	else:
		get_node("/root/Hlavni").addToLog("- Minuls")
		return 0
