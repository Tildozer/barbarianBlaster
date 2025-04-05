extends PathFollow3D

@export_range(50, 200) var max_health := 50
@export_range(1, 50, 0.5) var speed: float = 5.0
@export var gold_value := 25

var current_health : int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("takes_damage")
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_value
			queue_free()

@onready var animation_player = $AnimationPlayer 
@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")

func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	
	if progress_ratio == 1.0:
		base.take_damage(1)
		set_process(false)
		queue_free()
		

func take_damage(damage: int) -> void:
	current_health -= damage