extends Node2D

func _ready(): 
	pass 



# func _process(_delta): 
#	pass 


# Transfors a string representing board position into a number representing
# it's index on the board 
static func position_string_to_index(position_string): 
	var column = 0
	if position_string[0] == "A":
		column = 0	
	if position_string[0] == "B":
		column = 1	
	if position_string[0] == "C":
		column = 2	
	if position_string[0] == "D":
		column = 3	
	if position_string[0] == "E":
		column = 4	
	if position_string[0] == "F":
		column = 5	
	if position_string[0] == "G":
		column = 6	
	if position_string[0] == "H":
		column = 7	
	
	var position = ((int(position_string[1])- 1) * 8) + column 
	return position 


# returns the bitmap corresponding to the piece located on the position
static func piece_table(position): 
	var idx = 0
	var num_to_return = 1
	if typeof(position) == TYPE_STRING: 
		idx = position_string_to_index(position)
	else: idx = position
	num_to_return = num_to_return >> idx 
	return num_to_return





