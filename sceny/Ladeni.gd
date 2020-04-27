extends GridContainer

func setPozice(pozice):
	$Pozice.text = "(" + str(pozice.x) + ", " + str(pozice.y) + ")"
