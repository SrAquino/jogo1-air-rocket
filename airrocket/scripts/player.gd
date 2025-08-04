extends StaticBody2D

@export var player1 : bool
var player_velocity : int = 500

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	moviments(delta)
	moviment_limit()

func moviments(delta: float)-> void:
	if player1:
		if Input.is_action_pressed("down1"):
			position.y += player_velocity * delta
		elif Input.is_action_pressed("up1"):
			position.y -= player_velocity * delta
	else :
		if Input.is_action_pressed("down2"):
			position.y += player_velocity * delta
		elif Input.is_action_pressed("up2"):
			position.y -= player_velocity * delta


func moviment_limit () -> void :
	position.y = clamp(position.y, 51,670)
