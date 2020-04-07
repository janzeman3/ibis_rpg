extends Panel

signal zaviramPostavu

func _on_Zavrit_pressed():
	hide()
	emit_signal("zaviramPostavu")
