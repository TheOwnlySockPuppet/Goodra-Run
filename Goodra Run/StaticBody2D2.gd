extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("indextest")

func _physics_process(delta):
	for index in get_slide_count():
		print(index)
		var collision = get_slide_collision(index)	
		if collision.collider is Player:
			queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
