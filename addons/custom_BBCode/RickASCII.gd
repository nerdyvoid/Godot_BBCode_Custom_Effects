tool
class_name RichTextRickASCII
extends RichTextEffect

# Tag syntax: [rick_ascii speed=8.0 bounce=4.0] 🕺 [/rick_ascii]
var bbcode = "rick_ascii"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var speed = float(char_fx.env.get("speed", 8.0))
	var bounce = float(char_fx.env.get("bounce", 4.0))
	
	# Current frame index (4-frame dance step cycle)
	var frame = int(char_fx.elapsed_time * speed) % 4
	
	# 1. Rhythmic Body Bounce (up and down on the beat)
	var beat_y = abs(sin(char_fx.elapsed_time * speed * 0.5)) * bounce
	char_fx.offset.y -= beat_y
	
	# 2. Frame-by-frame sway & limb offsets based on character index
	var idx = char_fx.relative_index
	
	match frame:
		0:
			# Frame 0: Classic Rick sway left
			char_fx.offset.x += sin(idx + char_fx.elapsed_time * 2.0) * 1.5
		1:
			# Frame 1: Side step right
			char_fx.offset.x += 2.0
			char_fx.offset.y -= 1.0
		2:
			# Frame 2: Arm pump / head tilt (simulated via 2D offset vector!)
			var tilt_angle = sin(char_fx.elapsed_time * 10.0 + idx) * 0.2
			char_fx.offset += Vector2(cos(tilt_angle), sin(tilt_angle)) * 2.0
		3:
			# Frame 3: Side step left & snap back
			char_fx.offset.x -= 2.0
			
	# 3. Dynamic Rick Astley Color Palette (Ginger Hair / Blue Jacket)
	if idx < 3:
		# Hair / Head area: Redhead / Orange-Gold
		char_fx.color = Color("#E67E22")
	elif idx < 8:
		# Jacket / Shirt area: Classy Blue
		char_fx.color = Color("#3498DB")
	else:
		# Pants / Microphones: Cool Gray
		char_fx.color = Color("#BDC3C7")
		
	return true
