extends Control

@export var ResH : int = 480
@export var ResW : int = 640

@onready var element_dict = $Res_Reader.Res_dict

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
			print(i)
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
			test_element.color = Color(1, 1, 1, 1)
			add_child(test_element)
			
func _on_button_pressed():
	inter_dict()
