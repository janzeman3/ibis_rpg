extends TileMap

func jeVolno(cilPozice):
	var cil = world_to_map(cilPozice)
	var cil_type = get_cellv(cil)

	$Label.text = str(cil) + " " + str(cil_type)

	if cil_type==-1:
		return true
	else:
		return false
	
