extends Area2D

export var rychlost = 400  # How fast the player will move (pixels/sec).
var velikostOkna  # Size of the game window.

func _ready():
	velikostOkna = get_viewport_rect().size

func kamChciJit(delta):
	var smerPohybu = Vector2()  # The player's movement vector.
	var novaPozice = Vector2() 
	if Input.is_action_pressed("ui_right"):
		smerPohybu.x += 1
		$Lucisnik.animation = "doprava"
	if Input.is_action_pressed("ui_left"):
		smerPohybu.x -= 1
		$Lucisnik.animation = "doleva"
	if Input.is_action_pressed("ui_down"):
		smerPohybu.y += 1
		$Lucisnik.animation = "dolu"
	if Input.is_action_pressed("ui_up"):
		smerPohybu.y -= 1
		$Lucisnik.animation = "nahoru"
	if smerPohybu.length() > 0:
		smerPohybu = smerPohybu.normalized() * rychlost
		$Lucisnik.play()
	else:
		$Lucisnik.stop()

	novaPozice = position + smerPohybu * delta

	novaPozice.x = clamp(novaPozice.x, 0, velikostOkna.x)
	novaPozice.y = clamp(novaPozice.y, 0, velikostOkna.y)

	return novaPozice

