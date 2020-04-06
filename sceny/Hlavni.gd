extends Node

func _ready():
	$Inventar.hide()

func _on_Ovladani_oteviramInventar():
	$Inventar.show()
	$Ovladani.hide()

func _on_Inventar_zaviramInventar():
	$Ovladani.show()
