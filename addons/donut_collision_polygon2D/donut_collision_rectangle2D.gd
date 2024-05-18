@tool
class_name DonutCollisionRectangle
extends CollisionPolygon2D
## A Collider in the shape of a Rectangle with a hole in the middle

@export var size := Vector2(10.0, 20.0):
	set(new_size):
		size = new_size
		update_polygons()
@export var width: float = 2.0:
	set(new_width):
		width = new_width
		update_polygons()


func _ready() -> void:
	build_mode = CollisionPolygon2D.BUILD_SOLIDS
	update_polygons()


func update_polygons() -> void:
	var points := get_rectangle_points(size)
	polygon = points


func get_rectangle_points(size: Vector2) -> PackedVector2Array:
	var half_width := width / 2
	var inner_rectangle := get_rectangle_corners(size - Vector2(half_width, half_width))
	var outer_rectangle := get_rectangle_corners(size + Vector2(half_width, half_width))
	inner_rectangle.reverse()
	var points := PackedVector2Array()
	points.append_array(outer_rectangle)
	points.append(outer_rectangle[0])  # Connect the last point of the outer rectangle to the first point
	points.append_array(inner_rectangle)
	points.append(inner_rectangle[0])  # Connect the last point of the inner rectangle to the first point
	return points


func get_rectangle_corners(size: Vector2) -> PackedVector2Array:
	var half_size := size / 2
	var points := PackedVector2Array()
	points.push_back(Vector2(-half_size.x, -half_size.y))
	points.push_back(Vector2(half_size.x, -half_size.y))
	points.push_back(Vector2(half_size.x, half_size.y))
	points.push_back(Vector2(-half_size.x, half_size.y))
	return points
