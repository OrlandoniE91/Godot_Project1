extends Area2D

func _on_body_entered(body):
	$AnimatedSprite2D.play("hit")
	%HUD.add_diamond()
	queue_free()
