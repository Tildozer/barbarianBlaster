extends CanvasLayer

@onready var star_1 = %star1
@onready var star_2 = %star2
@onready var star_3 = %star3
@onready var base = get_tree().get_first_node_in_group("base")
@onready var health_label = %health_label
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var bank_label = %bank_label

func _on_retry_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")


func _on_quit_pressed() -> void:
	get_tree().quit()

func victory() -> void:
	visible = true
	if base.max_health == base.current_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
		if bank.gold >= 500:
			star_3.modulate = Color.WHITE
			bank_label.visible = true
	