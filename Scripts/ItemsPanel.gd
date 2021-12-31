extends Panel

onready var itemsList = get_node("ItemList")
onready var itemData = get_node("RichTextLabel")

var itemSerializer = load("res://Scripts/ItemSerializer.gd").new()

var selected_item : int = -1

#TODO: Add a form of source control built in to exporting files (make this a setting too)
#TODO: When selecting an Item Type hide/show text boxes according to that item's data

func _ready():
	itemSerializer.LoadItemData()
	ListItems()

func SetItemText(index):
	var i = itemsList.get_item_metadata(index)
	itemData.text = "Name: " + str(i.GetName()) + "\nLore: " + str(i.GetLore()) + "\nWeight: " + str(i.GetWeight()) + "\nValue: " + str(i.GetValue()) + "\nMax Stack: " + str(i.GetMaxStack()) + "\nTypes: " + str(i.GetTypes())

func ListItems():
	itemsList.clear()
	for i in range(len(ItemDatabase.items)):
		itemsList.add_item(ItemDatabase.items[i].GetName(), null, true)
		itemsList.set_item_metadata(i, ItemDatabase.items[i])

func SearchItem(item):
	itemsList.clear()
	for i in range(len(ItemDatabase.items)):
		if (item in ItemDatabase.items[i].GetName()):
			itemsList.add_item(ItemDatabase.items[i].GetName(), null, true)
			itemsList.set_item_metadata(i, ItemDatabase.items[i])

func _on_ItemSearchEdit_text_changed(new_text):
	if (new_text != ""):
		SearchItem(new_text)
	else:
		ListItems()


func _on_ItemList_item_selected(index):
	selected_item = index
	SetItemText(index)


func _on_RefreshList_pressed():
	ListItems()
	pass


func _on_SaveDatabaseButton_pressed():
	itemSerializer.SaveItemData()
	pass


func _on_RemoveItem_pressed():
	if (selected_item != -1):
		ItemDatabase.RemoveItemByObject(itemsList.get_item_metadata(selected_item))
		selected_item = -1
		ListItems()
	pass
