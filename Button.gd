extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pause_pressed():
	var current:bool = get_tree().paused
	print('Current', current, ' not: ', not current)
	get_tree().paused = not current


func _on_Reset_pressed():
	var ball = get_parent().get_node('../Ball')
	var point = get_node('/root/World/SpawnPoint')
	var width:float = get_node('/root/World/Pinko/Board/MeshInstance').mesh.size.x

	ball.linear_velocity = Vector3.ZERO
	ball.angular_velocity = Vector3.ZERO

	var pos:Vector3 = point.global_transform.origin
	var randplace = Vector3(
		rand(0), # no random on X (forward/backward)
		rand(1), # minor random on y (U/D)
		rand(width * .4) # much random on z (L/R)
		)
	pos += randplace
	print("Spwnpoint offset:", randplace)
	ball.global_transform.origin = pos


func rand(spread:float=1.0):
	return rng.randf_range(-spread, spread)
