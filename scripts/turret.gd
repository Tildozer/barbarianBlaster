extends Node3D

@export var projectile: PackedScene

@onready var barrel = $turret_base/barrel_base/barrel

func _on_timer_timeout() -> void:
    var shot = projectile.instantiate()
    add_child(shot)
    shot.global_position = barrel.global_position
