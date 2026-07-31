tool
class_name RichTextSoulOut
extends RichTextEffect

# Tag syntax: [soul_out spd=18.0 flee_spd=320.0] FLEEING! \n / \ [/soul_out]
var bbcode = "soul_out"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	# Retrieve short parameters: 'spd' for leg patter frequency, 'flee_spd' for exit velocity
	var speed = float(char_fx.env.get("spd", 16.0))
	var flee_speed = float(char_fx.env.get("flee_spd", 280.0))
	
	var time = char_fx.elapsed_time
	var idx = char_fx.relative_index
	
	# Phase 1: Undertale Soul Shiver (0.0s to 0.35s)
	if time < 0.35:
		char_fx.offset.x += (1 if idx % 2 == 0 else -1) * 2.0
		return true
		
	# Phase 2: Sprint Off-Screen (time >= 0.35s)
	var run_time = time - 0.35
	
	# 2-Frame footstep patter
	var step_frame = int(run_time * speed + idx) % 2
	var step_y = -5.0 if step_frame == 1 else 0.0
	
	# Sprint left
	var flee_x = -run_time * flee_speed
	
	char_fx.offset.x += flee_x
	char_fx.offset.y += step_y
	
	return true
