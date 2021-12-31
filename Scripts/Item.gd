extends Node

var _name: String
var _lore: String
var _weight: float
var _value: int
var _maxStack: int
var _types

func _ready():
	pass

func SetData(sname: String, lore:String, weight: float, value: int, maxStack: int, types: Array):
	self._name = sname
	self._lore = lore
	self._weight = weight
	self._value = value
	self._maxStack = maxStack
	self._types = types

func GetName():
	return self._name

func GetLore():
	return self._lore

func GetWeight():
	return self._weight

func GetValue():
	return self._value

func GetTypes():
	return self._types

func GetMaxStack():
	return self._maxStack
