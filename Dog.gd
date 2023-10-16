extends Sprite2D

@onready var characterTexture = load ("res://Assets/Images/chien_bouge_pas.png")
@onready var dogState = "waiting"
var uiScore
var graveKeeper
var crow
var eatingSound
var crowAlertSound
var score = 0
var gameIsOver = false
var eatingSoundPlaying = false
var childSoundPlaying = false
var childSound
var restartSound


# Called when the node enters the scene tree for the first time.
func _ready():
	uiScore = get_node("/root/MainScene/UI/Score")
	graveKeeper = get_node("/root/MainScene/GameScene/graveKeeper")
	crow = get_node("/root/MainScene/GameScene/Crow")
	eatingSound = get_node("/root/MainScene/Audio/eating")
	childSound = get_node("/root/MainScene/Audio/child")
	restartSound = get_node("/root/MainScene/Audio/restart")
	set_process_input(true)
	texture = characterTexture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameIsOver == true and Input.is_action_pressed("restart"):
		restartSound.playSound()
		get_tree().reload_current_scene()
	if !gameIsOver:	
		if Input.is_action_pressed("biteHand"):
			handleDogBite()
		else:
			resetDog()
		
		
func handleDogBite():
	
	if graveKeeper.getState() == "left":
		if !childSoundPlaying:
			childSound.playSound()
			childSoundPlaying = true
		gameOver(score)
	elif crow.getState() == "alert":
		gameOver(score)
	else:
		if !eatingSoundPlaying:
			eatingSound.playEatingSound()
			eatingSoundPlaying = true
		texture = load ("res://Assets/Images/chien_bouge.png")
		dogState = "biting"
		score += 1
		uiScore.updateScore(score)
		
		
func resetDog():
	if eatingSoundPlaying:
		eatingSound.stopEatingSound()
		eatingSoundPlaying = false
	texture = load ("res://Assets/Images/chien_bouge_pas.png")
	dogState = "waiting"
	
	
func gameOver(score):
	uiScore.gameOver(score)
	gameIsOver = true
	

