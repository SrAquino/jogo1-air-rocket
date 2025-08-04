extends Node2D

var points1 : int = 0
var points2 : int = 0

@onready var boll : Area2D = $"../Bola"
@onready var text_point1 : Label = $"../UI/Control/Player1_point"
@onready var text_point2 : Label = $"../UI/Control/Player2_point"

@onready var som_gol : AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Sair"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()


func _on_gol_1_area_entered(_area: Area2D) -> void:
	print("jogador 2 marcou")
	points2+=1 
	text_point2.text = str(points2)
	boll.reset_boll()
	som_gol.play()


func _on_gol_2_area_entered(_area: Area2D) -> void:
	print("jogador 1 marcou")
	points1+=1
	text_point1.text = str(points1)
	boll.reset_boll()
	som_gol.play()
	
