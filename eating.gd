extends AudioStreamPlayer2D

var audioSound = preload("res://Assets/Music/eating.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = audioSound
	stream.loop = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playEatingSound():
	stream.loop = true
	play()
	

func stopEatingSound():
	stream.loop = false

	
