extends Node

var _damage: int
var _durability: int

func _ready():
	pass

func GetDictionary():
	return {"name":"Pickaxe", "damage": self._damage, "durability": self._durability}

func SetData(dict):
	self._damage = dict["damage"]
	self._durability = dict["durability"]

func GetDurability():
	return self._durability

func GetDamage():
	return self._damage

func PrintInfo():
	print("Damage to rocks: " + str(_damage))
