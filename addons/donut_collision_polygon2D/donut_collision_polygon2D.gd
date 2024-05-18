@tool
class_name DonutCollisionPolygon2D
extends CollisionPolygon2D
## A Collider in the shape of a Donut

@export var radius: float = 10.0:
	set(rad):
		radius = rad
		update_polygons()
@export var width: float = 2.0:
	set(w):
		width = w
		update_polygons()
@export_range(5, 256) var quality: int = 32:
	set(q):
		quality = q
		update_polygons()


func _ready() -> void:
	build_mode = CollisionPolygon2D.BUILD_SOLIDS
	update_polygons()


func update_polygons() -> void:
	var points := get_polygon_points(Vector2(0,0), radius)
	polygon = points


func get_polygon_points(center: Vector2, radius: float) -> PackedVector2Array:
	var half_width := width / 2
	var inner_circle := get_circle_points(center, radius - half_width)
	var outer_circle := get_circle_points(center, radius + half_width)
	inner_circle.reverse()
	var points := PackedVector2Array()
	points.append_array(outer_circle)
	points.append_array(inner_circle)
	points.append(outer_circle[0] + Vector2(0.0001, 0.0001))
	return points


func get_circle_points(center: Vector2, radius: float, angle_from: float = 0, angle_to: float = 360) -> PackedVector2Array:
	var nb_points := 16
	var points_arc := PackedVector2Array()
	for i in range(quality + 1):
		var angle_point := deg_to_rad(angle_from + i * (angle_to - angle_from) / quality - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	return points_arc
