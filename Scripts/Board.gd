extends Node2D


export(PackedScene) var board_square

# Called when the node enters the scene tree for the first time.
func _ready():
	create_board_on_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func create_board_on_screen():
	var SQUARE_SIZE = 32 
	var cur_x = $SpawnLocation.position.x
	var cur_y = $SpawnLocation.position.y

	var counter = 0
	for i in range(8):
		for j in range(8): 
			var cur_pos = Vector2(cur_x, cur_y)
			var new_square = board_square.instance()
			add_child(new_square)
			new_square.position = cur_pos
			new_square.set_index(counter)	
			new_square.set_row(i)
			new_square.set_col(j)
			new_square.change_color()
			cur_x += SQUARE_SIZE
			counter+= 1
		cur_y -= SQUARE_SIZE
		cur_x = $SpawnLocation.position.x

