extends Node

var _name
var _lore
var _weight
var _value
var _maxStack
var _type

func _ready():
	pass

func SetData(sname, lore, weight, value, maxStack, type):
	_name = sname
	_lore = lore
	_weight = weight
	_value = value
	_maxStack = maxStack
	_type = null

func GetName():
	return _name

func GetLore():
	return _lore

func GetWeight():
	return _weight

func GetValue():
	return _value

func GetType():
	return _type

func GetMaxStack():
	return _maxStack
