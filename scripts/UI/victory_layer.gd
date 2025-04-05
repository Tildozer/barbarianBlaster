extends CanvasLayer

func _on_retry_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")


func _on_quit_pressed() -> void:
	get_tree().quit()
