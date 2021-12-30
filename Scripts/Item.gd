extends Node

var _name: String
var _lore: String
var _weight: float
var _value: int
var _maxStack: int
var _type

func _ready():
	pass

func SetData(sname, lore, weight, value, maxStack, type):
	self._name = sname
	self._lore = lore
	self._weight = weight
	self._value = value
	self._maxStack = maxStack
	self._type = null

func GetName():
	return self._name

func GetLore():
	return self._lore

func GetWeight():
	return self._weight

func GetValue():
	return self._value

func GetType():
	return self._type

func GetMaxStack():
	return self._maxStack
