extends CharacterBody2D

var velocidad:int = 300
var direccion = null
var direccionY = null

func _physics_process(delta):
	direccion = Input.get_axis("ui_left","ui_right")
	direccionY = Input.get_axis("ui_up","ui_down")
	velocity.y = velocidad * direccionY
	velocity.x = velocidad * direccion
	
	velocity.normalized()
	move_and_slide()
