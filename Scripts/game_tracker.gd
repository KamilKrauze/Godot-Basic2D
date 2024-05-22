extends Node

# This script is autoloaded, so basically it's a Singleton class
# Navigate to project settings, on the "Autoload" tab

static var _player_points:int = 0

var maxGems: int = 0
var gemsFound: int = 0

func _ready():
	reset()

func reset():
	maxGems = 0
	gemsFound = 0

# When the game starts, each gem will call this function
func addGem() -> void:
	maxGems+=1
	pass

# Add to the total gems found
func foundGem() -> void:
	gemsFound+=1
	clamp(gemsFound, 0, maxGems)
	pass

# Add points to the player
func grantPointsToPlayer(amount: int) -> void:
	_player_points += amount

# Get total gems found
func getTotalGemsFound() -> int:
	return gemsFound
	
# Get max gems found
func getMaxGems() -> int:
	return maxGems
	
# Get total points
func getTotalPoints() -> int:
	return _player_points
