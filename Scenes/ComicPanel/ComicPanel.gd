extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var DIST_TO_CAM_ALPHA = 200.0

export(String) var Panel_Left
export(String) var Panel_Right
export(bool) var is_active_panel = false
var current_time = 0

var camera
var dist_to_camera
func _ready():
	set_physics_process(true)
	camera = get_node("/root/Root/Camera2D")
	current_time = global.global_time
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):

	#print(camera.position.distance_to(self.position))
	self.dist_to_camera = camera.global_position.distance_to(self.global_position)
	$Panel_Dark.modulate.a = 1.0 - DIST_TO_CAM_ALPHA/self.dist_to_camera

func _time_change(new_time):
	$Panel_Time.text = str(new_time)
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
