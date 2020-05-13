extends Panel

func addToLog(ttext):
	$LogStream.add_item(ttext)
	$LogStream.select($LogStream.get_item_count()-1)
	$LogStream.ensure_current_is_visible()
