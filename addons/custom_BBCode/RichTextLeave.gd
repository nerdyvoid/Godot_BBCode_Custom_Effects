tool
class_name RichTextIAmLeave
extends RichTextEffect

# Tag syntax: [i_am_leave speed=8.0 move_speed=80.0]Nope, I am out of here.[/i_am_leave]
var bbcode = "i_am_leave"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var speed = float(char_fx.env.get("speed", 8.0))
	var move_speed = float(char_fx.env.get("move_speed", 100.0))
	
	var time = char_fx.elapsed_time
	var idx = char_fx.relative_index
	
	# Phase 1: Lift up slightly to make room for legs (0s - 0.5s)
	var lift = clamp(time * 20.0, 0.0, 12.0)
	char_fx.offset.y -= lift
	
	# Phase 2: Walking Motion & Horizontal Exit
	# Walking leg oscillation (sine wave per character)
	var step_cycle = sin((time * speed) + (idx * 0.8))
	var leg_walk_y = abs(step_cycle) * 4.0
	
	# Move entire text block to the right (or left if move_speed is negative)
	var exit_x = time * move_speed
	char_fx.offset.x += exit_x
	char_fx.offset.y -= leg_walk_y
	
	# Phase 3: Morph bottom/first/last characters into legs at the start of exit
	# If this is whitespace or specific leg position markers, swap to leg ASCII codepoints!
	if time > 0.3:
		# Alternate characters to draw walking legs for the "lead" and "tail" characters
		if idx % 3 == 0:
			if step_cycle > 0:
				char_fx.offset.y += 6.0 # Extension leg
			else:
				char_fx.offset.y -= 2.0
				
	return true
