extends Node2D

export (PackedScene) var cardPackedScene

var rng = RandomNumberGenerator.new()


func _ready():

	_load_cards()
	rng.randomize()

	var my_random_number = int(rng.randf_range(1, Glovar.current_max_number + 1))
	print(my_random_number)
	Glovar.current_number = my_random_number

	var cardInstance = cardPackedScene.instance()
	cardInstance.load_and_save_card(Glovar.current_deck,Glovar.current_number)
	add_child(cardInstance)

func _on_next_pressed():
	var my_random_number
	while true:
		my_random_number = int(rng.randf_range(1, Glovar.current_max_number + 1))
		if my_random_number != Glovar.current_number:
			break
	print(my_random_number)

	Glovar.current_number = my_random_number

	var cardInstance = cardPackedScene.instance()
	cardInstance.load_and_save_card(Glovar.current_deck,Glovar.current_number)
	add_child(cardInstance)

func _load_cards():
	var path = "res://cards/" + Glovar.current_deck + "/data.gd"
	print(path)
	$data.set_script(load(path))
	Glovar.current_max_number = $data.content
