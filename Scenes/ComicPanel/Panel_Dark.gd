tool
extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	self.rect_size = get_node("../Panel").rect_size
	self.rect_position = get_node("../Panel").rect_position
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
