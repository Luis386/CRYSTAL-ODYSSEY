extends CharacterBody2D

var health: int = 10
var speed := 120.0
var direction := 0.0
var jump_force := 150.0
const GRAVITY := 9.8

@onready var anim = $AnimationPlayer	
@onready var sprite = $Sprite2D

func _physics_process(delta):
	# Obtener dirección del movimiento
	direction = Input.get_axis("ui_left", "ui_right")

	# Aplicar velocidad horizontal
	velocity.x = direction * speed

	# Reproducir animación según el estado
	if is_on_floor():
		if direction != 0:
			anim.play("correr")
		else:
			anim.play("idle")
	else:
		if velocity.y < 0:
			anim.play("Saltar")
		else:
			anim.play("Salto_caida")

	# Voltear el sprite según la dirección
	sprite.flip_h = direction < 0

	# Saltar si está en el suelo y se presiona el botón de salto
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump_force

	# Aplicar gravedad
	velocity.y += GRAVITY * delta

	# Mover al personaje y manejar colisiones
	move_and_slide()

	# Verificar si el personaje ha perdido toda su salud
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Contacto"):
		health -= 2
		print("Salud:", health)


#func _on_area_2d_body_entered(body):
	
	#if body.is_in_group("Contacto"):
	#	vida -=2
	#print(vida)
