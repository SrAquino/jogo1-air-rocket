extends StaticBody2D

@export var player1 : bool
@export var cpu : bool

var player_velocity : int = 500
var boll_pos : Vector2
var move_by : int

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
	else:
		if Input.is_action_pressed("down2"):
			position.y += player_velocity * delta
		elif Input.is_action_pressed("up2"):
			position.y -= player_velocity * delta
			
	if cpu : 
		boll_pos = $"../Bola".position
		move_by = player_velocity * delta * sign(position.y - boll_pos.y)
		position.y -= move_by


func moviment_limit () -> void :
	position.y = clamp(position.y, 63,657)
