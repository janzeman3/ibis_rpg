extends GridContainer

signal oteviramInventar
signal oteviramPostavu
signal oteviramQuesty

func _ready():
	pass


func _on_otevriInventar_pressed():
	emit_signal("otevriInventar")

func _on_otevriPostavu_pressed():
	emit_signal("oteviramPostavu")

func _on_otevriQuesty_pressed():
	emit_signal("oteviramQuesty")
