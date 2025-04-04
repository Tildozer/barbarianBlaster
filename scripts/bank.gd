extends MarginContainer

@export var starting_gold := 150

@onready var gold_label: Label = $Label

var gold: int:
    set(gold_in):
        gold = max(gold_in, 0)
        gold_label.text = "gold: %s" % gold


func _ready() -> void:
    gold = starting_gold
