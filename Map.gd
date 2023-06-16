extends Node2D



func get_tilemap():
	return find_child("MapCreator")



func generate_level(borders :Rect2):
	var walker = Walker.new(Vector2(0,0), borders)
	var map = walker.walk(90)
	var tileMap = self.get_tilemap()
	
	walker.queue_free()
	print(tileMap)
	
	for i in map:
		tileMap.set_cell(0, i, 0, Vector2(0,0), true)
