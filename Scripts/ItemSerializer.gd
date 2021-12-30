extends Node

var path = ProjectSettings.globalize_path("res://")
var directory = path+"/Exports/"

func _ready():
	pass

#TODO: Add a form of source control built in to exporting files (make this a setting too)

func LoadItemData():
	CreateExportDirectory()
	var file = File.new()
	if (file.file_exists(directory+"items.json")):
		file.open(directory+"items.json", File.READ)
		var items = parse_json(file.get_line())
		file.close()
		if (items != null):
			for i in items:
				var q = load("res://Scripts/Item.gd").new()
				q.SetData(i.name, i.lore, i.weight, i.value, i.maxStack, i.type)
				ItemDatabase.items.append(q)

func SaveItemData():
	CreateExportDirectory()
	var file = File.new()
	var it = []
	file.open(directory+"items.json", File.WRITE)
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

func CreateExportDirectory():
	var dir = Directory.new()
	if (!dir.dir_exists(path+"/Exports/")):
		dir.make_dir(directory)
