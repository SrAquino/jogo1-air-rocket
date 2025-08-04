extends Area2D

var boll_velocity : int = 500
var initial_position : Vector2 = Vector2(640,360)
var initial_direction : Vector2 = Vector2(0,0)
var new_direction : Vector2 = Vector2(0,0)

var y_min : float = 0
var y_max : float = 720

var x_min : float = 0
var x_max : float = 1280

@onready var son_impacto_barreira : AudioStreamPlayer2D = $barreira
@onready var son_impacto_player : AudioStreamPlayer2D = $som_player


@onready var timer : Timer = $Timer

func _ready() -> void:
	reset_boll()
	
func _process(delta: float) -> void:
	boll_moviment(delta)
	wall_colider()

func boll_moviment(delta: float)->void :
	position += new_direction * boll_velocity * delta
	#if position.x > x_max or position.x < x_min:
	#	reset_boll()
	
func choose_inicial_direction()-> void:
	var randon_x = [-1,1].pick_random()
	var randon_y = [-1,1].pick_random()
	
	initial_direction = Vector2(randon_x,randon_y)
	new_direction = initial_direction

func reset_boll()-> void:
	new_direction = Vector2(0,0)
	position = initial_position
	start_timer()
	

func start_timer()->void:
	timer.start()
	

func wall_colider()-> void:
	if position.y >= y_max or position.y <= y_min:
		new_direction.y *= -1 
		son_impacto_barreira.play()
		


func _on_body_entered(body: Node2D) -> void:
	print(body.get_groups())
	if body.is_in_group("players"):
		new_direction.x *= -1
		son_impacto_player.play()


func _on_timer_timeout() -> void:
	choose_inicial_direction()
