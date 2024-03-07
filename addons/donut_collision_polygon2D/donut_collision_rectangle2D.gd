tool
class_name DonutCollisionRectangle
extends CollisionPolygon2D

export(Vector2) var size := Vector2(10.0, 20.0) setget set_size
export(float) var width := 2.0 setget set_width

func _ready() -> void:
	self.build_mode = CollisionPolygon2D.BUILD_SOLIDS
	update_polygons()

func set_size(new_size: Vector2) -> void:
    size = new_size
    update_polygons()

func set_width(new_width: float) -> void:
    width = new_width
    update_polygons()

func update_polygons() -> void:
    var points = get_rectangle_points(size)
    self.polygon = points

func get_rectangle_points(size: Vector2) -> PoolVector2Array:
	var half_width = width / 2
	var inner_rectangle = get_rectangle_corners(size - Vector2(half_width, half_width))
	var outer_rectangle = get_rectangle_corners(size + Vector2(half_width, half_width))
	inner_rectangle.invert()

	var points = PoolVector2Array()
	points.append_array(outer_rectangle)
	points.append(outer_rectangle[0])  # Connect the last point of the outer rectangle to the first point
	points.append_array(inner_rectangle)
	points.append(inner_rectangle[0])  # Connect the last point of the inner rectangle to the first point
	return points

func get_rectangle_corners(size: Vector2) -> PoolVector2Array:
    var half_size = size / 2
    var points = PoolVector2Array()
    points.push_back(Vector2(-half_size.x, -half_size.y))
    points.push_back(Vector2(half_size.x, -half_size.y))
    points.push_back(Vector2(half_size.x, half_size.y))
    points.push_back(Vector2(-half_size.x, half_size.y))
    return points