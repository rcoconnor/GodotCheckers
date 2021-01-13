extends Node2D


# Declare member variables here. Examples:
var index = 0
var row = 0
var column = 0


var color = "black"
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_color():
	var is_dark = false 
	if (row % 2 == 0): 
		if (column % 2 == 0): 
			is_dark = true
		else: is_dark = false	
	else: 
		if (column % 2 == 0): 
			is_dark = false
		else: is_dark = true
	if is_dark: 
		$AnimatedSprite.play("Dark")
	else: $AnimatedSprite.play("Light")



func set_row(new_row): 
	row = new_row


func set_col(new_col):
	column = new_col

func set_index(new_index): 
		index = new_index






