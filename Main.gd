extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process_input(true)
	pass

func _input(event):
	if(event.is_action_pressed("ui_left")):
		
		var old_left = $Left.get_child(0)
		var old_active = $Active.get_child(0)
		var old_right = $Right.get_child(0)
		
		$Left.remove_child(old_left)
		$Active.remove_child(old_active)
		$Right.remove_child(old_right)


		$Right.add_child(old_active)
		old_active.scale = $Right.scale
		
		$Active.add_child(old_left)
		old_left.scale = $Active.scale
		print("Press left")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
