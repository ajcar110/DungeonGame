extends Node3D

const Cell = preload("res://map_cell.tscn")

@export var Map: PackedScene
@export var borders = Rect2(1, 1, 23, 23)
var cells = []

func _ready():
	randomize()
	generate_map()

func generate_map():
	if not Map is PackedScene: return
	var map = Map.instantiate()
	map.generate_level(borders)
	var tileMap = map.get_tilemap()
	var used_tiles = tileMap.get_used_cells(0)
	map.free() # We don't need it now that we have the tile data
	for tile in used_tiles:
		var cell = Cell.instantiate()
		add_child(cell)
		cell.position = Vector3(tile.x*Globals.GRID_SIZE, 0, tile.y*Globals.GRID_SIZE)
		cells.append(cell)
	for cell in cells:
		cell.update_faces(used_tiles)
#	print("Cell_List: " + str(used_tiles))
