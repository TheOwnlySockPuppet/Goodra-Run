extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-1, 0)
	#move_and_slide(Vector2(-50, 0), Vector2(0, -1))


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
