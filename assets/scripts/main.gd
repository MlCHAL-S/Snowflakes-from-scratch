extends Node2D


var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(4)
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn():
	
	# create an object/node 
	var snowflake = load("res://assets/scenes/sniezynka.tscn").instance()
	add_child(snowflake)
	
	# choose the object's position
	snowflake.position = Vector2(lerp(200,1000,randf()), -100)
	
	snowflake.connect('touched', self, 'snowflake_signal_handler')

# spawn a snowflake once the timer is off
func _on_Timer_timeout():
	spawn()


func snowflake_signal_handler():
	points += 1
	print(points)
