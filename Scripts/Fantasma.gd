extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null
var vida:int = 5
#var damage:int = 3
 
func _ready():
	player = get_node("/root/Node2D/Personaje/Player")
func _physics_process(delta):
	if player != null:
		
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * SPEED		
	move_and_slide()

func Attack(player:CharacterBody2D, damage:int) -> void:
	player.vida -= damage
	print(player)
	
func Muerte() -> void:
	if vida <= 0 :
		queue_free()

#func _on_area_2d_body_entered(body):
#	if body.name == "Player":
#		Attack(body, damage)
#	else:
#		return
