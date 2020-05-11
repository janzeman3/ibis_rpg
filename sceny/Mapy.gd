extends Node

const MySmokeResource = preload("res://sceny/nemrtvy_noob.tscn")

var monsterList = []

var kam_nemohu = [-1, 0, 17, 86 , 87,16, 31, 53, 51, 26, 27]

var monster1_spawn = 7


func jeVolno(cilPozice):
	var cil = $Mapa1.world_to_map(cilPozice)
	var cil_type = $Mapa1.get_cellv(cil)

	if kam_nemohu.has(cil_type):
		return false
	else:
		return true

func monster1spawn(kdeJe):
	$Mapa1.set_cell(kdeJe.x,kdeJe.y,8)
	
	var novy = MySmokeResource.instance()
	novy.position.x = (kdeJe.x+1)*32 + 16
	novy.position.y = (kdeJe.y+1)*32 - 16
	add_child(novy)
	monsterList.append(novy)

func hrac_zmenil_pozici(novaPozice):
	var kdeJe = $Mapa1.world_to_map(novaPozice)
	var kdeJe_type = $Mapa1.get_cellv(kdeJe)
	
	if kdeJe_type == monster1_spawn:
		monster1spawn(kdeJe)

