extends Panel

signal zaviramPostavu

onready var Hrac = get_node("/root/Hlavni/Hrac") # odkaz na hrace

func _on_Zavrit_pressed():
	hide()
	emit_signal("zaviramPostavu")

func _process(delta):
	$GridContainer/GridContainer/valXP.text = str(Hrac.XP)
	$GridContainer/GridContainer/valHP.text = str(Hrac.HP) + "/" + str(Hrac.maxHP)
	$GridContainer/GridContainer/valUC.text = str(Hrac.UC)
	$GridContainer/GridContainer/valOC.text = str(Hrac.OC)
