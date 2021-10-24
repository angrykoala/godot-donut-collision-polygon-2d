extends Area2D

func _on_mouse_enter() -> void:
	print("Mouse Enter")

func _on_mouse_exit() -> void:
	print("Mouse Exit")

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("On Mouse Click")
