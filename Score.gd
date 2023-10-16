extends Label


@onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(str(score))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func updateScore(score):
	set_text(str(score))
	
func gameOver(score):
	set_text("GAME OVER - Score : " + str(score))
