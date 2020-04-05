extends Area2D

export var rychlost = 400  # How fast the player will move (pixels/sec).
var velikostOkna  # Size of the game window.

func _ready():
	velikostOkna = get_viewport_rect().size

func _process(delta):
	var smerPohybu = Vector2()  # The player's movement vector.
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
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	position += smerPohybu * delta
	position.x = clamp(position.x, 0, velikostOkna.x)
	position.y = clamp(position.y, 0, velikostOkna.y)
