extends AudioStreamPlayer2D

var audioTheme = preload("res://Assets/Music/Teddy and Marge - Dark Eyes.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	stream = audioTheme
	play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


