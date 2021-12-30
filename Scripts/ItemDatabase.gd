extends Control

var items : Array = []

#TODO: Add saving and loading of items into the array

func _ready():
	pass

func GetItemName(itemName):
	for i in items:
		if (itemName == i.GetName()):
			return i

func GetItemId(itemId):
	for i in items:
		if (itemId in i):
			return itemId[i]

func RemoveItemId(itemId):
	for i in items:
		if (itemId in i):
			items.remove(i)

func AddItem(item):
	if (!item in items):
		items.append(item)
