# Donut Collision Polygon 2D for Godot
_by @angrykoala_    
A donut-shaped collision shape for Godot.

This plugin creates a new Node type for a donut collision shape for 2D collisions.

![Donut Example](screenshots/donut_example.png)

![Donut Rectangle](screenshots/donut_rectangle_example.png)

## Instructions

1. Add the folder `donut_collision_polygon2D` to `addons/`.
2. Activate the plugin in [Godot](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html).
3. Create any collision or physics 2D node (e.g. `Area2D` or `RigidBody2D`).
4. Add a `DonutCollisionPolygon2D` or `DonutCollisionRectangle2D` as child.    
![Tree Example](screenshots/tree_example.png)

## Properties

* **radius**: Defines the radius of the donut. This will be the circumference at the **center** of the donut.
* **width**: The width of the donut.
* **quality**: The number of points to use **per circumference**. The total points count will be `quality*2+1`. 

## License
Made by [@angrykoala](https://github.com/angrykoala). [MIT License](LICENSE)
