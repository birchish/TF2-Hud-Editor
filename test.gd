extends Node


func _ready():
	print(get_var_array("		\"tall\"	\"60\""))
	
func get_var_array(line):
	var Routput  = ""
	var output = ""
	var t
	for i in range(line.length() - 1, -1, -1):
		Routput += line[i]
	t = get_name_array(Routput)
	for u in range(t.length() - 1, -1, -1):
		output += t[u]
	return output
	
func get_name_array(line):
	var c : int = 0
	var p : int = 0
	var output = ""
	while p < 2 and c < line.length():
		if line[c] == "\"" :
			p += 1
		else:
			output += line[c]
		c += 1
	return output

func VEREW(line):
	var regex = RegEx.new()
	regex.compile("(?<=\\\")\\S+?(?=\\\"\\n)")
	var result = regex.search(line)
	if result:
		print(result.get_string())
