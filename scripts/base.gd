extends Node3D

var white: Color = Color.WHITE
var red: Color = Color.RED

@export_range(1, 50, 1.0) var max_health: int = 5
var current_health: int:
	set(health_in):
		current_health = health_in
		print("Health is now: ", current_health)
		label.text = str(current_health, "/", max_health)
		var step: float = float(current_health) / max_health
		label.modulate = red.lerp(white, step)
		if current_health < 1:
			get_tree().call_deferred("reload_current_scene")

@onready var label = $Label3D

func _ready() -> void:
	current_health = max_health

func take_damage(damage: int) -> void:
	current_health -= damage
