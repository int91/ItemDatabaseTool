extends Panel

onready var nameEdit = get_node("NameEdit")
onready var loreEdit = get_node("LoreEdit")
onready var weightEdit = get_node("WeightEdit")
onready var valueEdit = get_node("ValueEdit")
onready var dmgEdit = get_node("DamageEdit")
onready var durEdit = get_node("DurabilityEdit")
onready var itemTypes = get_node("ItemTypes")

var _defTypes = ["Pickaxe"]
var _itemTypes = ["Pickaxe"]
var types = []

func _ready():
	ListTypes()

func CheckItemTypes():
	dmgEdit.hide()
	durEdit.hide()
	if ("Pickaxe" in types):
		dmgEdit.placeholder_text = "Pickaxe Damage"
		durEdit.placeholder_text = "Pickaxe Durability"
		dmgEdit.show()
		durEdit.show()

func ListTypes():
	itemTypes.clear()
	for i in _itemTypes:
		if not (i in types):
			itemTypes.add_item(i, null, false)

func _on_AddItemButton_pressed():
	var i = load("res://Scripts/Item.gd").new()
	for t in len(types):
		match (types[t]):
			"Pickaxe":
				var s = load("res://Scripts/Types/Pickaxe.gd").new()
				s.SetData({"damage":dmgEdit.text, "durability":durEdit.text})
				types[t] = s
				break
	i.SetData(nameEdit.text, loreEdit.text, float(weightEdit.text), int(valueEdit.text), int(valueEdit.text), types)
	ItemDatabase.AddItem(i)
	types = []
	ListTypes()
	CheckItemTypes()

func _on_ItemTypes_item_selected(index):
	types.append(_itemTypes[index])
	ListTypes()
	CheckItemTypes()
