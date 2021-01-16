extends Node2D








var lookup = preload("LookupTables.gd")
var dark_pieces = 0x000000000055AA55
#var light_pieces = 0xAA55AA0000000000

export(PackedScene) var piece


func _ready(): 
	place_pieces()	


func _process(_delta): 
	pass

# Places all the pieces at the start of the game
func place_pieces():
	var pieces_to_place = dark_pieces	
	for each_child in $Board.get_children():	
		var lsb = pieces_to_place & 1
		if lsb == 1: 
			var piece_instance = piece.instance()
			each_child.add_child(piece_instance)
			piece_instance.position = Vector2.ZERO 
		pieces_to_place = pieces_to_place >> 1



