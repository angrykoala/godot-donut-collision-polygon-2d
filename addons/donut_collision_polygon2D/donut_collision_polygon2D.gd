tool
class_name DonutCollisionPolygon2D
extends CollisionPolygon2D

export(float) var radius:=10.0 setget set_radius
export(float) var width:=2.0 setget set_width
export(int, 5, 256) var quality:=32 setget set_quality

func _ready() -> void:
	self.build_mode=CollisionPolygon2D.BUILD_SOLIDS
	update_polygons()

func set_radius(rad:float) -> void:
	radius=rad
	update_polygons()

func set_width(w:float) -> void:
	width=w
	update_polygons()

func set_quality(q:int) -> void:
	quality=q
	update_polygons()

func update_polygons() -> void:
	var points=get_polygon_points(Vector2(0,0), radius)
	self.polygon=points

func get_polygon_points(center, radius) -> PoolVector2Array:
	var half_width=width/2
	var inner_circle=get_circle_points(center, radius-half_width)
	var outer_circle=get_circle_points(center, radius+half_width)
	inner_circle.invert()

	var points=PoolVector2Array()
	points.append_array(outer_circle)
	points.append_array(inner_circle)
	points.append(outer_circle[0]+Vector2(0.0001, 0.0001))
	return points

func get_circle_points(center, radius, angle_from=0, angle_to=360) -> PoolVector2Array:
	var nb_points = 16
	var points_arc = PoolVector2Array()

	for i in range(quality + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / quality - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	return points_arc
