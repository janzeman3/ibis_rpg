extends Node2D

enum charaktery{
  Lucistnik,
  Mag
}

export var rychlost = 200  # How fast the player will move (pixels/sec).
export var typ = charaktery.Lucistnik

var cil = Vector2(0, 0)
var smer = Vector2(0, 0)

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

func _input(event):
	if event is InputEventMouseButton:
		cil = event.position

func _process(delta):
	pass

func kamChciJit(delta):
	var novaPozice = Vector2() 
	var animace = aktivniTyp.get_node("AnimatedSprite")
	
	smer = cil - aktivniTyp.position
	
	if smer.length() > 5:
		smer = smer.normalized() * rychlost
		animace.play()
		
		if abs(smer.x) > abs(smer.y):
			if smer.x > 0:
				animace.animation = "doprava"
			else:
				animace.animation = "doleva"
		else:
			if smer.y > 0:
				animace.animation = "dolu"
			else:
				animace.animation = "nahoru"	
	else:
		smer = Vector2(0, 0)
		animace.animation = "stuj"
		animace.stop()

	novaPozice = aktivniTyp.position + smer * delta

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
