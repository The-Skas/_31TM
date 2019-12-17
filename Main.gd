extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var comic_panels = {}
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

	set_process_input(true)
	var temp_panels = get_tree().get_nodes_in_group("ComicPanel")
	for panel in temp_panels:
		comic_panels[panel.name] = panel
		
	set_active_panel("Kitchen")

func reparent_node(parent_orig, parent_new, node):
	get_node(parent_orig).remove_child(node)
	get_node(parent_new).add_child(node)
	
func return_comic_frames(node_name):
	if(get_node(node_name).get_child_count() > 0):
		var temp = get_node(node_name).get_child(0)
		for child in get_node(node_name).get_children():
			get_node(node_name).remove_child(child)
			$ComicFrames.add_child(child)
		
func set_comic_panel(panel_pos="Active", panel_node=null):
	
	panel_node.get_parent().remove_child(panel_node)
	get_node(panel_pos).add_child(panel_node)
	panel_node.global_position = get_node(panel_pos).global_position
	panel_node.scale = get_node(panel_pos).start_scale
	pass

func set_active_panel(new_active_node_name):

	
	return_comic_frames("Left")
	return_comic_frames("Right")
	return_comic_frames("Active")
	
	var new_active_node = comic_panels[new_active_node_name]

	
	#Set Active
	set_comic_panel("Active", new_active_node)


	if(comic_panels.has(new_active_node.Panel_Left)):
		set_comic_panel("Left", comic_panels[new_active_node.Panel_Left])
	if(comic_panels.has(new_active_node.Panel_Right)):
		set_comic_panel("Right", comic_panels[new_active_node.Panel_Right])	
	

	## might not find it in comic frames due to it being in left or right...

 
func prepare_animate_panel(start_value, end_value,property, time, node):
	$Animate.interpolate_property(node,property,start_value, end_value, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

var animation_speed = .75
func _input(event):
	if(event.is_action_pressed("ui_right")):
		if(comic_panels.has($Active.get_child(0).Panel_Right)):
			#Animate and Scale 'Active'
			prepare_animate_panel($Active.global_position, $Left.global_position, "global_position", animation_speed,$Active.get_child(0))
			prepare_animate_panel($Active.start_scale, $Left.start_scale, "scale", animation_speed,$Active.get_child(0))

			#Animate and Scale 'Right'
			prepare_animate_panel($Right.global_position, $Active.global_position, "global_position", animation_speed,$Right.get_child(0))
			prepare_animate_panel($Right.start_scale, $Active.start_scale, "scale", animation_speed,$Right.get_child(0))

			set_active_panel($Active.get_child(0).Panel_Right)
			$Animate.start()
	elif(event.is_action_pressed("ui_left")):
		if(comic_panels.has($Active.get_child(0).Panel_Left)):
			prepare_animate_panel($Active.global_position, $Right.global_position, "global_position", animation_speed,$Active.get_child(0))
			prepare_animate_panel($Active.start_scale, $Right.start_scale, "scale", animation_speed,$Active.get_child(0))

			#Animate and Scale 'Right'
			prepare_animate_panel($Left.global_position, $Active.global_position, "global_position", animation_speed,$Left.get_child(0))
			prepare_animate_panel($Left.start_scale, $Active.start_scale, "scale", animation_speed,$Left.get_child(0))
			$Animate.start()
			set_active_panel($Active.get_child(0).Panel_Left)

	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Time_value_changed(value):
	get_tree().call_group("ComicPanel","_time_change",value)
	print("New Time: ",value)
	pass # replace with function body
