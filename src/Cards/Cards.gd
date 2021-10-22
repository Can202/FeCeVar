extends Node2D

var Original_Name = "Name"
var Original_Desc = "Description"
var Translate_Name = "Translation"
var Translate_Desc = "Translation Description"
var Main_Color = "white"
const SENTENCE = 0
const DESCRIPTION = 1
const TRANSLATE = 2
const TRANSLATE_DESCRIPTION = 3
const COLOR = 4

var current_number = Glovar.current_number

func _ready():	
	match Main_Color:
		"white":
			$back.modulate = Color( 1, 1, 1, 1 )
		"black":
			$back.modulate = Color( 0, 0, 0, 1 )
		"red":
			$back.modulate = Color( 1, .2, .2, 1 )
		"green":
			$back.modulate = Color( .2, 1, .2, 1 )
		"blue":
			$back.modulate = Color( .2, .2, 1, 1 )
	
	$principal.text = Original_Name
	$desc.text = Original_Desc

func _process(delta):
	if current_number != Glovar.current_number:
		queue_free()
		print("deleted " + str(current_number))

func _on_show_pressed():
	if $principal.text == Original_Name:
		$principal.text = Translate_Name
		$desc.text = Translate_Desc
	else:
		$principal.text = Original_Name
		$desc.text = Original_Desc
		
		
func load_card(name = "", number = 1):
	var data = {}
	var path = "res://cards/" + name + "/" + str(number) + ".gd"
	print(path)
	$data.set_script(load(path))
	data["sentence"] = $data.sentence
	data["translate"] = $data.translate
	data["description"] = $data.description
	data["translate_description"] = $data.translate_description
	data["color"] = $data.color
	return data

func load_and_save_card(name = "", number = 1):
	var data = load_card(name, number)
	Original_Name = data["sentence"]
	Original_Desc = data["description"]
	Translate_Name = data["translate"]
	Translate_Desc = data["translate_description"]
	Main_Color = data["color"]
