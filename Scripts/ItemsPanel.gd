extends Panel

onready var ItemsList = get_node("ItemList")
onready var ItemData = get_node("RichTextLabel")

onready var itemSerializer = load("res://Scripts/ItemSerializer.gd").new()

func _ready():
	itemSerializer.LoadItemData()
	ListItems()

func SetItemText(index):
	var i = ItemDatabase.GetItemName(ItemsList.items[index])
	ItemData.text = "Name: " + str(i.GetName()) + "\nLore: " + str(i.GetLore()) + "\nWeight: " + str(i.GetWeight()) + "\nValue: " + str(i.GetValue()) + "\nMax Stack: " + str(i.GetMaxStack())

func ListItems():
	ItemsList.clear()
	for i in ItemDatabase.items:
		ItemsList.add_item(i.GetName())

func SearchItem(item):
	ItemsList.clear()
	for i in ItemDatabase.items:
		if (item in i.GetName()):
			ItemsList.add_item(i.GetName())

func _on_ItemSearchEdit_text_changed(new_text):
	if (new_text != ""):
		SearchItem(new_text)
	else:
		ListItems()


func _on_ItemList_item_selected(index):
	SetItemText(index)


func _on_RefreshList_pressed():
	ListItems()
	pass


func _on_SaveDatabaseButton_pressed():
	itemSerializer.SaveItemData()
	pass
