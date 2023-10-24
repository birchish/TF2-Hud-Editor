extends Control

@export var ResH : int = 480
@export var ResW : int = 640

@onready var element_dict = $Res_Reader.Res_dict
@onready var option = $Editor/ItemList
var selected = 0

func _ready():
	pass


func inter_dict():
	for K in element_dict.keys():
		add_element(K)
		
func add_element(element):
	var w = 0
	var t = 0
	var test_element = ColorRect.new()
	for i in element_dict[element]:
			if i[0] == "\t\txpos":
				test_element.position.x = int(i[1])
			if i[0] == "\t\typos":
				test_element.position.y = int(i[1])
			if i[0] == "\t\twide":
				if i[1] == "f0":
					w = int(640)
				else:
					w = int(i[1])
			if i[0] == "\t\ttall":
				t = int(i[1])
			test_element.reparent($HUD,false)
			test_element.set_size(Vector2(w,t))
			test_element.color = Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 0.05)
			add_child(test_element)
			
func _on_button_pressed():
	print(selected)
	add_element(element_dict.keys()[selected])


func _on_item_list_item_selected(index):
	selected = index

func _on_button_2_pressed():
	for i in element_dict.keys():
		option.add_item(str(i))
