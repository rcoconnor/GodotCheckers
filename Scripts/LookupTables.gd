extends Object


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
	else: 
		idx = position
	num_to_return = num_to_return << idx 
	return num_to_return


static func piece_table_test(): 
	for i in range(64): 
		var value = piece_table(i)
		print("%d: val: %016X" % [i, value])



# returns a bitboard that when anded with another bitboard masks 
static func mask_rank(rank): 
	var hex_num_to_return = "00000000000000"		
	var string_to_return = hex_num_to_return.insert(rank * 2, "FF")	
	return string_to_return		


# returns a hex string that represents a bitboard.  When the string is anded
# with another board it clears the board except for that rank 
static func clear_rank(rank):
	var start_string = "FFFFFFFFFFFFFF"
	var string_to_return = start_string.insert(rank * 2, "00")
	return string_to_return


# Returns a bitboard that when anded with another bitboard clears the specified
# file 
static func clear_file(file): 
	var string_to_return = ""	
	if (file == 0): string_to_return = "FEFEFEFEFEFEFEFE" 	
	if (file == 1): string_to_return = "FDFDFDFDFDFDFDFD" 	
	if (file == 2): string_to_return = "FBFBFBFBFBFBFBFB" 	
	if (file == 3): string_to_return = "F7F7F7F7F7F7F7F7" 	
	if (file == 4): string_to_return = "EFEFEFEFEFEFEFEF" 	
	if (file == 5): string_to_return = "DFDFDFDFDFDFDFDF" 	
	if (file == 6): string_to_return = "BFBFBFBFBFBFBFBF" 	
	if (file == 7): string_to_return = "7F7F7F7F7F7F7F7F" 	
	return string_to_return
 
static func mask_file(file): 
	var string_to_return = ""	
	if (file == 0): string_to_return = "0101010101010101" 	
	if (file == 1): string_to_return = "0202020202020202" 	
	if (file == 2): string_to_return = "0404040404040404" 	
	if (file == 3): string_to_return = "0808080808080808" 	
	if (file == 4): string_to_return = "1010101010101010" 	
	if (file == 5): string_to_return = "2020202020202020" 	
	if (file == 6): string_to_return = "4040404040404040" 	
	if (file == 7): string_to_return = "8080808080808080" 	
	
	return string_to_return



# Tests each rank in order to make sure everything is correct 
static func clear_rank_test():
	for i in range(8):
		print(str(i) + ": ", clear_rank(i))
#		print("val: %016X" % val)
#		print("bin: ", convert_to_binary_string(val))




# prints the value of mask_rank in order for each rank 
static func mask_rank_test(): 
	for i in range(8): 
		var num = mask_rank(i)	
		print(str(i) + ": ", num)





# Converts an integer into a 64-bit binary number
static func convert_to_binary_string(num): 
	var bin_string = ""
	#print("num: %016X" % num)	
	var count = 63 
	while count >= 0: 
		var temp = num >> count
		if (temp & 1): bin_string += "1"
		else: bin_string += "0"
		count -= 1
	return bin_string


# Function to test the funcitonaliity of the convert_to_binary_string(function)
static func test_binary(): 
	var num = 0x00000000000000FF
	for _i in range(8): 
		print("hex num: %016X" % num)	
		print("num: " + convert_to_binary_string(num))
		num = num << 8



static func get_dark_starting_hex_value(): 
	return "000000000055AA55"
	#	return 	"0000000000AA55AA"


static func get_light_starting_hex_values(): 
	return "AA55AA0000000000"


