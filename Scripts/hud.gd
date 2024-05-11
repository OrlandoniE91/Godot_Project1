extends CanvasLayer

var score = 0
var life = 3

func add_diamond():
	score += 1
	$Score.text = str(score)
	
func add_heart():
	life += 1

func sub_heart():
	pass
