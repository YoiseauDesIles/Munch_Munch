extends Sprite2D

@export var changeDelay: int = 20
@export var speedDelay: int = 10
@export var changingStateProbability = 2
@export var probabilityRange = 10
@export var crowAlertStateDelay = 30
@export var crowPreAlertDelay = 100

@onready var changingStateCnt = changeDelay
@onready var crowTexture = load ("res://Assets/Images/corbeau_droit.png")
@onready var crowState = "standby"
@onready var crowDelayCnt = crowAlertStateDelay
@onready var crowAlertSound
@onready var crowSoundPlaying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	texture = crowTexture
	crowAlertSound = get_node("/root/MainScene/Audio/crowAlert")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if crowState == "alert" or crowState =="preAlert":
		if !crowSoundPlaying:
			crowAlertSound.playSound()
			crowSoundPlaying = true
		handleCrow(delta)
	else:
		if crowSoundPlaying:
			crowAlertSound.stopSound()
			crowSoundPlaying = false
		if changingStateCnt <= 0:
			checkNewState()
			changingStateCnt = changeDelay
		changingStateCnt = changingStateCnt - delta * speedDelay

func checkNewState():
	var currProbability = randi() % 10
	var currProbResult = probabilityRange - currProbability 
	print(currProbResult)
	if currProbResult <= changingStateProbability :
		setCrowToAlert()
	
func setCrowToAlert():
	
	crowState = "preAlert"
	crowTexture = load ("res://Assets/Images/corbeau.png")
	texture = crowTexture

		
	
func resetCrow():
	crowState = "standby"
	crowTexture = load ("res://Assets/Images/corbeau_droit.png")
	texture = crowTexture
	
func randomizeCrowAlertDelay():
	var random = RandomNumberGenerator.new()
	random.randomize()
	crowAlertStateDelay = random.randi_range(10,20)
	print("crow Alert Delay : " + str(crowAlertStateDelay))
	
func handleCrow(delta):
	if crowDelayCnt <= 0:
		if crowState == "preAlert":
			randomizeCrowAlertDelay()
			crowDelayCnt = crowAlertStateDelay
			crowState = "alert"
			crowTexture = load ("res://Assets/Images/corbeau_oeil.png")
			texture = crowTexture
			
		elif crowState == "alert":
			resetCrow()
			crowDelayCnt = crowAlertStateDelay
			return
		
	crowDelayCnt = crowDelayCnt - delta * speedDelay
	
func getState():
	return crowState
