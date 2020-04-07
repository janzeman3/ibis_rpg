extends Node

func _ready():
	$Inventar.hide()
	$Postava.hide()

func _on_Ovladani_oteviramInventar():
	$Ovladani.hide()
	$Inventar.show()

func _on_Inventar_zaviramInventar():
	$Ovladani.show()

func _on_Postava_zaviramPostavu():
	$Ovladani.show()

func _on_Ovladani_oteviramPostavu():
	$Ovladani.hide()
	$Postava.show()
