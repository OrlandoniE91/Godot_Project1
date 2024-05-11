extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_body_entered(body):
	$AnimatedSprite2D.play("opening")

func _on_body_exited(body):
	$AnimatedSprite2D.play("closing")
