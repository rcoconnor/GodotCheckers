extends Object

# Bitboard Class
# 
# This class is responsible for representing the gamestate as a sequence of
# bits each representing whether or not there exists a piece on that index of
# the board.  If the bit is set, there exists a piece 

var board_state = String()
var b_board_state = String()

func _ready(): 
	board_state = "0000000000000000";	


func _process(_delta): 
	pass 


func right_shift():
	var new_string = "" 

	var last = b_board_state[63]
	for i in range(64): 
		new_string += last
		last = b_board_state[i]
	return new_string	


func left_shift(): 
	var new_string = ""	
	var first = b_board_state[0]	
	for i in range(63): 
		new_string += b_board_state[i+1]
	new_string += first	
	return new_string



static func construct_hex_from_binary(bin_board_state): 
	var cur_byte = "" 
	var string_to_return = ""
	var counter = 0
	for each_entry in bin_board_state: 
		cur_byte += each_entry
		counter += 1
		if (counter >= 4): 
			counter = 0
			string_to_return += get_hex_from_byte(cur_byte)
			cur_byte = ""
	return string_to_return


# constructs a binary string representing the board state from the given value
# of hex_string
static func construct_binary_from_hex(hex_string): 
	if(hex_string.length() != 16): 
		print("the size of the string is an incorrect value!") 
	var string_to_return = ""	
	for each_character in hex_string: 
		if (each_character == "0"): 
			string_to_return += "0000"
		if (each_character == "1"): 
			string_to_return += "0001"
		if (each_character == "2"): 
			string_to_return += "0010"
		if (each_character == "3"): 
			string_to_return += "0011"
		if (each_character == "4"): 
			string_to_return += "0100"
		if (each_character == "5"): 
			string_to_return += "0101"
		if (each_character == "6"): 
			string_to_return += "0110"
		if (each_character == "7"): 
			string_to_return += "0111"
		if (each_character == "8"): 
			string_to_return += "1000"
		if (each_character == "9"): 
			string_to_return += "1001"
		if (each_character == "A" || each_character == "a"): 
			string_to_return += "1010"
		if (each_character == "B" || each_character == "b"): 
			string_to_return += "1011"
		if (each_character == "C" || each_character == "c"): 
			string_to_return += "1100"
		if (each_character == "D" || each_character == "d"): 
			string_to_return += "1101"
		if (each_character == "E" || each_character == "e"): 
			string_to_return += "1110"
		if (each_character == "F" || each_character == "f"): 
			string_to_return += "1111"
	return string_to_return
	


	

# returns a character corresponding to the hexadecimal representation of the
# binarys string the_byte
static func get_hex_from_byte(the_byte): 
	var string_to_return = ""	
	if (the_byte == "0000"): 
		string_to_return = "0"
	if (the_byte == "0001"): 
		string_to_return = "1"
	if (the_byte == "0010"): 
		string_to_return = "2"
	if (the_byte == "0011"): 
		string_to_return = "3"
	if (the_byte == "0100"): 
		string_to_return = "4"
	if (the_byte == "0101"): 
		string_to_return = "5"
	if (the_byte == "0110"): 
		string_to_return = "6"
	if (the_byte == "0111"): 
		string_to_return = "7"
	if (the_byte == "1000"): 
		string_to_return = "8"
	if (the_byte == "1001"): 
		string_to_return = "9"
	if (the_byte == "1010"): 
		string_to_return = "A"
	if (the_byte == "1011"): 
		string_to_return = "B"
	if (the_byte == "1100"): 
		string_to_return = "C"
	if (the_byte == "1101"): 
		string_to_return = "D"
	if (the_byte == "1110"): 
		string_to_return = "E"
	if (the_byte == "1111"): 
		string_to_return = "F"
	return string_to_return


# returns a hex string representing the current state of the bitbaord 
func get_hex_representation(): 
	return board_state


# returns a binary represenation of the current game state 
func get_binary_representation(): 
	return b_board_state 


# sets the board to the state given by the value of hex_string, where a set bit
# means a piece exists on that square and a cleared bit means a piece does not
# exist on that square 
func set_board_to_hex(hex_string): 
	var bin_string = construct_binary_from_hex(hex_string)
	board_state = hex_string	
	b_board_state = bin_string 


func set_board_to_binary(bin_string): 
	b_board_state = bin_string
	board_state = construct_hex_from_binary(bin_string)


func get_lsb(): 
	return b_board_state[63]





