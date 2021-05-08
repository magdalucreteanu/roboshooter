extends Node


# Declare member variables here. Examples:
var maxEnemies = 1
	
# Called when the node enters the scene tree for the first time.
func _ready():
	generateEnemies()

func generateEnemies():
	var rand = RandomNumberGenerator.new()
	var enemyScene = load("res://Enemy.tscn")
	
	var levelLabel = get_tree().get_root().get_node("world/LevelLabel")
	#var levelLabel = get_node("world/LevelLabel")
	levelLabel.set_text("Level " + str(maxEnemies))
	
	var screenSize = get_viewport().get_visible_rect().size
	
	for i in range(0, maxEnemies):
		var enemy = enemyScene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screenSize.x)
		rand.randomize()
		var y = rand.randf_range(0, screenSize.y)
		enemy.position.x = x
		enemy.position.y = y
		enemy.set_name(name)
		add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() == 0:
		# all dead, generate more ane more
		maxEnemies += 1
		generateEnemies()
