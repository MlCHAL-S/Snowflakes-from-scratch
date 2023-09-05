extends Area2D

signal touched

const rotation_speed = 1
const speed = 200

var active: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var sc = lerp(4,9,randf())
	scale = Vector2(sc, sc)#lerp(4,9,randf())
	
	$AnimationPlayer.play("set_default")



func _physics_process(delta):
	
	# snowflake's movement
	rotation += rotation_speed * delta
	position.y += speed * delta


func _on_Area2D_input_event(viewport, event, shape_idx):
	
	
	# these are necessary 
	if event.get("position") != null:
		var event_position = common.translate_event_position(event.position)
		if event_position != Vector2():
			
			# then you play animations and do other stuff
			if active:
				active = false
				$AnimationPlayer.play("disappear")
				emit_signal("touched")


# 
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'disappear':
		queue_free()
