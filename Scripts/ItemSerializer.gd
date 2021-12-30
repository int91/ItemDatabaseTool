extends Node


func _ready():
	pass

func LoadItemData():
	var file = File.new()
	file.open("res://items.json", File.READ)
	var items = parse_json(file.get_line())
	file.close()
	for i in items:
		var q = load("res://Scripts/Item.gd").new()
		q.SetData(i.name, i.lore, i.weight, i.value, i.maxStack, i.type)
		ItemDatabase.items.append(q)

func SaveItemData():
	var file = File.new()
	var it = []
	file.open("res://items.json", File.WRITE)
	for i in ItemDatabase.items:
		var data = {
			"name":i.GetName(),
			"lore":i.GetLore(),
			"weight":i.GetWeight(),
			"value":i.GetValue(),
			"maxStack":i.GetMaxStack(),
			"type":i.GetType()}
		it.append(data)
	file.store_line(to_json(it))
	file.close()
