extends Sprite2D

@export var changeDelay: int = 100
@export var speedDelay: int = 45

@onready var changingStateCnt = changeDelay
@onready var characterTexture = load ("res://Assets/Images/typedroite.png")
@onready var characterState = "right"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	texture = characterTexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if changingStateCnt <= 0:
		changeCharacterState()
		changingStateCnt = changeDelay
		reduceChangingStateDelay()
	changingStateCnt = changingStateCnt - delta * speedDelay
	


func changeCharacterState():
	if characterState == "right":
		characterState = "middle"
		characterTexture = load ("res://Assets/Images/devant.png")
		texture = characterTexture
	elif characterState == "middle":
		characterState = "left"
		characterTexture = load ("res://Assets/Images/typegauche.png")
		texture = characterTexture
	elif characterState == "left":
		characterState = "right"
		characterTexture = load ("res://Assets/Images/typedroite.png")
		texture = characterTexture
		

func reduceChangingStateDelay():
	speedDelay += 1
	
func getState():
	return characterState
