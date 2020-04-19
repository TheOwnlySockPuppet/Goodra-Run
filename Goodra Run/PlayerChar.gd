extends KinematicBody2D
class_name Player

# Declare member variables here. Examples:
export (int) var player_speed = 50
export (int) var jump_power = 200
export (int) var gravity_rate = 150
var fall_speed = 0
var is_grounded = false
var knockback_timer
var knocked_back = false

# Called when the node enters the scene tree for the first time.
func _ready():
	knockback_timer = Timer.new()
	knockback_timer.connect("timeout", self, "_on_timer_timeout")
	add_child(knockback_timer)
	knockback_timer.set_wait_time(4)

func _physics_process(delta):
	var movement_input: Vector2
	if !knocked_back:
		movement_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var player_velocity = movement_input * player_speed
	
	if is_on_floor():
		fall_speed = 0
		var jump_test = Input.is_action_pressed('ui_accept')
		if 	jump_test:
			fall_speed = -jump_power
	
	elif !is_on_floor():
		fall_speed += (gravity_rate * delta)
		
	player_velocity.y = fall_speed
	move_and_slide(player_velocity, Vector2(0, -1))
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)	
		if collision.collider is Rockslide:
			queue_free()
		elif collision.collider is Boulder:
			knocked_back = true
			knockback_timer.start()

func _on_knockback_timer_timeout():
	knocked_back = false

