extends Node2D

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(2)
	$ui/Label.text = 'Your score: ' + str(points)
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn():
	
	# create an object/node 
	for i in range(14):
		var snowflake = load("res://assets/scenes/sniezynka.tscn").instance()
		add_child(snowflake)
		
		# choose the object's position
		snowflake.position = Vector2(lerp(50,1150,randf()), -1 * lerp(100,500,randf()))
		
		snowflake.connect('touched', self, 'snowflake_signal_handler')

# spawn a snowflake once the timer is off
func _on_Timer_timeout():
	spawn()


func snowflake_signal_handler():
	points += 1
	$ui/Label.text = 'Your score: ' + str(points)
