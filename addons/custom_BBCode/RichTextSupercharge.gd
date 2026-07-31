tool
class_name RichTextSupercharge
extends RichTextEffect

var bbcode = "supercharge"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var strength = float(char_fx.env.get("strength", 2.0))
	var freq = float(char_fx.env.get("freq", 25.0))
	
	var t = char_fx.elapsed_time
	
	# Panel-safe continuous pseudo-random jitter (no integer casting!)
	var noise_x = sin(t * freq + char_fx.absolute_index * 3.0) * cos(t * freq * 0.7)
	var noise_y = cos(t * freq + char_fx.absolute_index * 5.0) * sin(t * freq * 1.2)
	
	char_fx.offset += Vector2(noise_x, noise_y) * strength
	
	# High-voltage turquoise / white pulse
	var pulse = abs(sin(t * 12.0))
	var electric_blue = Color("#00E5FF")
	var electric_white = Color("#FFFFFF")
	
	var final_color = electric_blue.linear_interpolate(electric_white, pulse)
	final_color.a = char_fx.color.a
	char_fx.color = final_color
	
	return true
