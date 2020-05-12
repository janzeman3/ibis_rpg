extends Area2D

export var HP = 10
export var UC = 5
export var OC = 5

onready var Hrac = get_node("/root/Hlavni/Hrac")
onready var HracArea = Hrac.aktivniTyp

func _on_nemrtvy_noob_area_entered(area):
	
	if area==HracArea:
		Hrac.XP += 10
		queue_free()
