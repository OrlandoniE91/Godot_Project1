extends Area2D

func _on_body_entered(body):
	if (%HUD.life < 3):
		$AnimatedSprite2D.play("hit")
		queue_free()
		%HUD.add_heart()
