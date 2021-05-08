extends KinematicBody2D

# Declare member variables here. Examples:
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position) / 200
	look_at(Player.position)
	
	move_and_collide(motion)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
		
