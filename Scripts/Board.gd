extends Node2D


var  dark_pieces = 0x000000000055AA55
var light_pieces = 0xAA55AA0000000000

export(PackedScene) var piece



# Called when the node enters the scene tree for the first time.
func _ready():
	print("dark pieces: %016X" % dark_pieces)
	place_pieces()	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Places all the pieces at the start of the game
func place_pieces():
	var pieces_to_place = dark_pieces
	for each_child in get_children(): 
		# mask the value with 00001 in order to isolate LSB
		var lsb = pieces_to_place & 1
		if lsb == 1: # it exists, we should place it 
			var piece_instance = piece.instance()
			piece_instance.set_name("Piece")	
			add_child(piece_instance)
			piece_instance.position = each_child.position
		# Afterwards, shift by one bit in order to read the next value
		pieces_to_place = pieces_to_place >> 1






