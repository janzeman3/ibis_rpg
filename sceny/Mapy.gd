extends Node

var kam_nemohu = [-1, 0, 17]

func jeVolno(cilPozice):
	var cil = $Mapa1.world_to_map(cilPozice)
	var cil_type = $Mapa1.get_cellv(cil)
	
	if kam_nemohu.has(cil_type):
		return false
	else:
		return true

