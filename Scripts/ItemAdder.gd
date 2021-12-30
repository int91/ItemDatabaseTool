extends Panel

onready var nameEdit = get_node("NameEdit")
onready var loreEdit = get_node("LoreEdit")
onready var weightEdit = get_node("WeightEdit")
onready var valueEdit = get_node("ValueEdit")
onready var itemType = get_node("ItemType")

func _ready():
	pass

#func _process(delta):
#	pass


func _on_AddItemButton_pressed():
	var i = load("res://Scripts/Item.gd").new()
	i.SetData(nameEdit.text, loreEdit.text, float(weightEdit.text), int(valueEdit.text), int(valueEdit.text), null)
	ItemDatabase.AddItem(i)
	print(str(i))
	pass
