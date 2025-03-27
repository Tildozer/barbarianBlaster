extends PathFollow3D

@export_range(1, 50, 0.5) var speed: float = 5.0

@onready var base = get_tree().get_first_node_in_group("base")

func _process(delta: float) -> void:
	progress += delta * speed
	
	if progress_ratio == 1.0:
		base.take_damage(10.0)
		
