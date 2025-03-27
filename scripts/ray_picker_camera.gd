extends Camera3D

@onready var ray_picker: RayCast3D = $RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_picker.target_position = project_local_ray_normal(mouse_position) * 100.0
	ray_picker.force_raycast_update()
	printt(ray_picker.get_collider(), ray_picker.get_collision_point())
