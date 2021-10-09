extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var dying = false

var soundPlayed = false

func _ready():
	default_modulate = modulate

func _physics_process(_delta):
	if dying:
		queue_free()
	var selectSound = get_node("/root/Game/Select")
	if selected:
		if not soundPlayed:
			selectSound.play()
			soundPlayed = true
		$Tween.interpolate_property(self, "scale", scale, Vector2(.9,.9), .5, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
		$Tween.start()
		$Selected.emitting = true
	else:
		soundPlayed = false
		$Tween.interpolate_property(self, "scale", scale, Vector2(1,1), .5, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
		$Tween.start()
		$Selected.emitting = false
		
func move_piece(change):
	target_position = position + change
	position = target_position

func die():
	$Tween.interpolate_property(self, "position", position, Vector2(position.x, 1100), .8, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	$Tween.start()
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, 180, .8, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	$Tween.start()
	$Tween.interpolate_property(self, "modulate:a", 1, 0, .8, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Timer.wait_time = .8
	$Timer.start()
	set_z_index(1)


func _on_Timer_timeout():
	dying = true
