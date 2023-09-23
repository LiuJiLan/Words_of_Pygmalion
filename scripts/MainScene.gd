extends Control

var user_data;


# Called when the node enters the scene tree for the first time.
func _ready():
	detect_and_init_screen_size()
	user_data = preload("res://scripts/UserData.gd").new()
	print(user_data.DictData["design"])
	#user_data.MetaData
	pass
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func detect_and_init_screen_size():
	# 用于初始化的时候调整屏幕大小
	
	# From: 
	# https://docs.godotengine.org/en/stable/classes/class_displayserver.html
	# https://docs.godotengine.org/en/stable/classes/class_window.html
	
	var window:Window = self.get_window()
	var system_type:String = DisplayServer.get_name()
	
	if system_type == "Android" or system_type == "iOS":
		window.size = DisplayServer.screen_get_size()
	#else: # This few lines is for test on my Mac
		#var test_size:Vector2i = Vector2i(1024, 1024)
		#window.size = test_size
		
	
