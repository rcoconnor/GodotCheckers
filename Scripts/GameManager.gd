extends Node2D 

# GameManager Class
#
# This class is responsible for managing the gameplay of the checkers game 
# Hexadecimal numbers can be printed like so: print("val: %016X" % value)

var lookup = preload("LookupTables.gd")
var bitboard = preload("Bitboard.gd")

var dark_pieces
var light_pieces

var pieces_array = Array()

var CUR_INDEX = 0

#var dark_pieces = 0x000000000055AA55

export(PackedScene) var piece


func _ready(): 
	dark_pieces = bitboard.new()
	dark_pieces.set_board_to_hex(lookup.get_dark_starting_hex_value())	
	print("val: ", dark_pieces.get_binary_representation())
	print("hex: ", dark_pieces.get_hex_representation())
	place_pieces()


	#lookup.clear_rank_test()
	#lookup.mask_rank_test()
	#lookup.test_binary()


func _process(_delta): 	
	pass

func _input(event):  
	if event.is_action_pressed("ui_select"): 
		refresh_board()
		CUR_INDEX += 1
		place_pieces_from_board(lookup.mask_rank(CUR_INDEX-1))


func refresh_board(): 
	for each_piece in pieces_array: 
		each_piece.queue_free()
	pieces_array = Array()



func place_pieces_from_board(hex_string): 
	print("str: ", hex_string)	
	var children = $Board.get_children()
	var bin_string = bitboard.construct_binary_from_hex(hex_string) 
	print("bin: ", bin_string)
	print("-------------------------")
	for i in range(64): 
		if (bin_string[63-i] == "1"): 
			var piece_instance = piece.instance()
			children[i].add_child(piece_instance)
			piece_instance.position = Vector2.ZERO
			pieces_array.append(piece_instance)


# Places all the pieces at the start of the game
func place_pieces():
	var children = $Board.get_children()	
	for i in range(64): 
		if (dark_pieces.get_lsb() == "1"):
			var piece_instance = piece.instance()
			children[i].add_child(piece_instance)
			piece_instance.position = Vector2.ZERO
			pieces_array.append(piece_instance)
		dark_pieces.set_board_to_binary(dark_pieces.right_shift())


#	for each_child in $Board.get_children():	
#		var lsb = pieces_to_place & 1
#		if lsb == 1: 
#			var piece_instance = piece.instance()
#			each_child.add_child(piece_instance)
#			piece_instance.position = Vector2.ZERO 
#		pieces_to_place = pieces_to_place >> 1

func test_hex_from_byte(): 
	print("val: ", bitboard.get_hex_from_byte("0000"))	
	print("val: ", bitboard.get_hex_from_byte("0001"))	
	print("val: ", bitboard.get_hex_from_byte("0010"))	
	print("val: ", bitboard.get_hex_from_byte("0011"))	
	print("val: ", bitboard.get_hex_from_byte("0100"))	
	print("val: ", bitboard.get_hex_from_byte("0101"))	
	print("val: ", bitboard.get_hex_from_byte("0110"))	
	print("val: ", bitboard.get_hex_from_byte("0111"))	
	print("val: ", bitboard.get_hex_from_byte("1000"))	
	print("val: ", bitboard.get_hex_from_byte("1001"))	
	print("val: ", bitboard.get_hex_from_byte("1010"))	
	print("val: ", bitboard.get_hex_from_byte("1011"))	
	print("val: ", bitboard.get_hex_from_byte("1100"))	
	print("val: ", bitboard.get_hex_from_byte("1101"))	
	print("val: ", bitboard.get_hex_from_byte("1110"))	
	print("val: ", bitboard.get_hex_from_byte("1111"))	





