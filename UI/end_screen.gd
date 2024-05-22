extends Control

@onready var gemsFound: int = GameTracker.getTotalGemsFound()
@onready var maxGems: int = GameTracker.getMaxGems()
@onready var score: int = GameTracker.getTotalPoints()

@onready var gems_tally = $MarginContainer/VBoxContainer/HBoxContainer/GemsTally
@onready var penalty_tally = $MarginContainer/VBoxContainer/HBoxContainer2/PenaltyTally
@onready var score_tally = $MarginContainer/VBoxContainer/HBoxContainer3/ScoreTally
@onready var total_tally = $MarginContainer/VBoxContainer/HBoxContainer4/TotalTally
@onready var button = $MarginContainer/VBoxContainer/Button
@onready var timer = $Timer

@onready var display_blip = $DisplayBlip
@onready var final_blip = $FinalBlip


func _ready():
	gems_tally.text = str(gemsFound) + "/" + str(maxGems)
	penalty_tally.text = str(maxGems-gemsFound) +" x 10"
	score_tally.text = str(score)
	total_tally.text = str(score - ((maxGems-gemsFound) * 10))

var counter: int = 0
# Progressively show results
func _on_timer_timeout():
	if counter < 4:
		match counter:
			0:
				gems_tally.visible = true
			1:
				penalty_tally.visible = true
			2:
				score_tally.visible = true
			3:
				total_tally.visible = true
	counter+=1


func _on_final_blip_finished():
	button.disabled = false

func _on_visibility_changed():
	display_blip.play()	

func _on_total_tally_visibility_changed():
	final_blip.play()
	timer.stop()
