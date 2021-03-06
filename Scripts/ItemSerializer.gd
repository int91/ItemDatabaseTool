extends Node

var path = ProjectSettings.globalize_path("res://")
var directory = path+"/Exports/"

var itemClass = preload("res://Scripts/Item.gd")

func _ready():
	pass

func LoadItemData():
	CreateExportDirectory()
	var file = File.new()
	if (file.file_exists(directory+"items.json")):
		file.open(directory+"items.json", File.READ)
		var items = parse_json(file.get_line())
		file.close()
		if (items != null):
			for i in items:
				AddItemToDatabase(i)

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
			"types":[]}
		for q in i.GetTypes():
			data.types.append(q.GetDictionary())
		it.append(data)
	file.store_line(to_json(it))
	file.close()

func CreateExportDirectory():
	var dir = Directory.new()
	if (!dir.dir_exists(path+"/Exports/")):
		dir.make_dir(directory)

func AddItemToDatabase(i):
	var q = itemClass.new()
	q.SetData(i.name, i.lore, i.weight, i.value, i.maxStack, i.types)
	for e in len(q.GetTypes()):
		var ty = q.GetTypes()[e]
		if (ty.name == "Pickaxe"):
			var t = load("res://Scripts/Types/"+ty.name+".gd").new()
			t.SetData(ty)
			q.GetTypes()[e] = t
	ItemDatabase.AddItem(q)
