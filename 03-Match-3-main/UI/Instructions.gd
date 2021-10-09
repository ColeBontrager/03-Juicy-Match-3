extends Control

var countdown = 5

func _ready():
	updateLabel()
	
func updateLabel():
	$CountdownLabel.text = "Starting in " + str(countdown)


func _on_Timer_timeout():
	countdown -= 1
	if countdown < 0:
		hide()
		$Timer.stop()
		get_tree().paused = false
		
	updateLabel()
	
