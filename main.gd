extends Control



func _ready():
	pass


func _on_Button_pressed():
	$AddItemPanel.show()
	$ItemsPanel.hide()
	pass


func _on_Button2_pressed():
	$ItemsPanel.show()
	$AddItemPanel.hide()
	pass
