extends PathFollow3D

@export_range(50, 200) var max_health := 50

@export_range(1, 50, 0.5) var speed: float = 5.0

var current_health : int:
	set(health_in):
		current_health = health_in
		print("Health is now: ", current_health)
		if current_health < 1:
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")

func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	
	if progress_ratio == 1.0:
		base.take_damage(1)
		set_process(false)
		

func take_damage(damage: int) -> void:
	current_health -= damage