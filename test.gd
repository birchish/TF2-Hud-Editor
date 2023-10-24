extends Node


func _ready():
	print(get_var_array("		\"fieldName\" \"HudPlayerStatus\""))
	
func get_var_array(line):
	var count : int = 0
	var output = ""
	var Routput = ""
	var line_l = line.length() - 1
	while count < 2:
		if line[line_l] == "\"":
			count += 1
		else:
			Routput += line[line_l]
		line_l -= 1	
	var Routput_l = Routput.length() - 1
	while Routput_l > -1:
		output += Routput[Routput_l]
		Routput_l += -1
	return output

func VEREW(line):
	var regex = RegEx.new()
	regex.compile("(?<=\\\")\\S+?(?=\\\"\\n)")
	var result = regex.search(line)
	if result:
		print(result.get_string())
