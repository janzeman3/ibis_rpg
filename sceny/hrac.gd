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
	if Input.is_action_pressed("ui_left"):
		smerPohybu.x -= 1
	if Input.is_action_pressed("ui_down"):
		smerPohybu.y += 1
	if Input.is_action_pressed("ui_up"):
		smerPohybu.y -= 1
	if smerPohybu.length() > 0:
		smerPohybu = smerPohybu.normalized() * rychlost
		animace.play()
	
		if abs(smerPohybu.x) > abs(smerPohybu.y):
			if smerPohybu.x > 0:
				animace.animation = "doprava"
			else:
				animace.animation = "doleva"
		else:
			if smerPohybu.y > 0:
				animace.animation = "dolu"
			else:
				animace.animation = "nahoru"	
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
