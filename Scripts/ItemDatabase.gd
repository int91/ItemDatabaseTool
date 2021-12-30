extends Node

var items = []

#TODO: Add saving and loading of items into the array

func _ready():
	OS.set_window_title("c_onvulse - Database Tool")
	pass

func GetItemIdByObject(object: Node):
	for i in range(len(items)):
		if (items[i].GetName() == object.GetName()):
			return i

func GetItemIdByName(itemName: String):
	for i in range(len(items)):
		if (items[i].GetName() == itemName):
			return i

func GetItemName(itemName: String):
	for i in range(len(items)):
		if (items[i].GetName() == itemName):
			return items[i]

func GetItemId(itemId: int):
	for i in items:
		if (itemId in i):
			return items[i]

func RemoveItemId(itemId: int):
	for i in items:
		if (itemId in i):
			items.remove(i)

func AddItem(item: Node):
	if (!item in items):
		items.append(item)

func RemoveItemByObject(object: Node):
	if object in items:
		var s = items.find(object)
		items.remove(s)
