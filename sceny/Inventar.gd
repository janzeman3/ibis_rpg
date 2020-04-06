extends Panel

signal zaviramInventar

func _on_Zavrit_pressed():
	hide()
	emit_signal("zaviramInventar")
