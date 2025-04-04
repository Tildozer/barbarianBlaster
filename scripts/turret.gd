extends Node3D

@export var projectile: PackedScene
@export_range(10, 50) var turret_range := 10.0

var enemy_path: Path3D
var target: PathFollow3D

@onready var barrel = $turret_base/barrel_base/barrel
@onready var animation_player = $AnimationPlayer

func _physics_process(_delta: float) -> void:
	target = best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		animation_player.play("recoil")
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = barrel.global_position
		shot.direction = global_transform.basis.z

func best_target() -> PathFollow3D:
	var newTarget = null
	var most_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D && enemy.progress > most_progress && enemy.global_position.distance_to(global_position) < turret_range:
			newTarget = enemy
			most_progress = enemy.progress
	return newTarget
