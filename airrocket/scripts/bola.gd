extends CharacterBody2D

var  boll_velocity : float = 500
var accel : float = 10
var dir : Vector2

#var initial_direction : Vector2 = Vector2(0,0)
#var new_direction : Vector2 = Vector2(0,0)

var window_size : Vector2

@onready var son_impacto_barreira : AudioStreamPlayer2D = $barreira
@onready var son_impacto_player : AudioStreamPlayer2D = $som_player

@onready var timer : Timer = $Timer

func _ready() -> void:
	window_size = get_viewport_rect().size
	start_timer()
	

func reset_boll()-> void:
	position = Vector2(window_size.x/2,window_size.y/2)
	dir = randon_direction()
	
func randon_direction():
	var new_dir := Vector2()
	new_dir.x = [1,1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

func _physics_process(delta: float):
	var collision = move_and_collide(dir * boll_velocity * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../Player2":
			print(collider)
			boll_velocity += accel
			dir = dir.bounce(collision.get_normal())
		else:
			dir = dir.bounce(collision.get_normal())
			
		
	
func start_timer()->void:
	timer.start()
	
func _on_timer_timeout() -> void:
	reset_boll()
