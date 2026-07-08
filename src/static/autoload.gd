extends Node

#const ASPECT_RATIO: float = 16.0 / 9.0
#
#func _process(delta: float):
	#if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		## Enforce the aspect ratio
		#var size: Vector2i = DisplayServer.window_get_size()
		#var current_ratio: float = float(size.x) / float(size.y)
		#
		#if abs(current_ratio - ASPECT_RATIO) > 0.01:
			#var new_size: Vector2i
#
			#if current_ratio > ASPECT_RATIO:
				## Too wide, increase height
				#new_size = Vector2i(
					#size.x,
					#int(size.x / ASPECT_RATIO)
				#)
			#else:
				## Too tall, increase width
				#new_size = Vector2i(
					#int(size.y * ASPECT_RATIO),
					#size.y
				#)
#
			#DisplayServer.window_set_size(new_size)
