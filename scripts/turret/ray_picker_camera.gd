extends Camera3D

@export var gridmap: GridMap
@export var turret_manager: Node3D
@export var turret_cost := 100

@onready var ray_picker: RayCast3D = $RayCast3D
@onready var bank = get_tree().get_first_node_in_group("bank")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_picker.target_position = project_local_ray_normal(mouse_position) * 100.0
	ray_picker.force_raycast_update()

	if ray_picker.is_colliding():
		if bank.gold >= turret_cost:
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
			var collider = ray_picker.get_collider()
			if collider is GridMap:
				if Input.is_action_just_pressed("click"):
					var collision_point = ray_picker.get_collision_point()
					var cell = gridmap.local_to_map(collision_point)
					if gridmap.get_cell_item(cell) == 0:
						gridmap.set_cell_item(cell, 1)
						var tile_position = gridmap.map_to_local(cell)
						turret_manager.build_turret(tile_position)
						bank.gold -= turret_cost
		else:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
