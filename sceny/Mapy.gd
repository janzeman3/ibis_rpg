extends Node

func jeVolno(cilPozice):
	var cil = $Mapa1.world_to_map(cilPozice)
	var cil_type = $Mapa1.get_cellv(cil)

	if cil_type==-1:
		return false
	else:
		return true

