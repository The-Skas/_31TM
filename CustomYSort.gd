extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process(true)


func _process(delta):
	var _closest_child_dist = 0
	var _children = get_children()
	for comicp in _children:
		if(comicp.dist_to_camera > _closest_child_dist):
			_closest_child_dist = comicp.dist_to_camera 
			move_child(comicp, 0)
			print("Moving Child, ", comicp)
	
	pass
