extends Node
var preamble = []
var Res_dict = {
	
}

func _ready():
	load_res()
	
func load_res():
	var preround = true
	var last_line
	var Element_Name
	var Element_in : bool = false
	var Element_Array = []
	
	if !FileAccess.file_exists("user://hudlayout.res"):
		print("No rayout.res file!")
		return 
	
	var F_layout = FileAccess.open("user://hudlayout.res",FileAccess.READ)
	
	var line
	
	while(preround):
		
		line = F_layout.get_line()
		preamble.append(line)
		last_line = line
		
		if (line == "{"):
			preround = false
		
	while F_layout.get_position() < F_layout.get_length():
		line = F_layout.get_line()
		
		if (line != "" and line != "	" and line != " "):
			if (!Element_in):
				if (line == "	{"):
					
					Element_in = true
					Element_Name = last_line.replace("\t" , "")
				
			else:
				if line.find("}") > 0:
					Res_dict[Element_Name] = Element_Array
					
					# Clear elements values
					Element_Name = ""
					Element_in = false
					Element_Array = []
					
				else:
					if (line != "" and line != "	" and line != " " and line != "\n" and line.find("\"")):
						Element_Array.append([get_name_array(line),get_var_array(line)])
				
		last_line = line # Must always be at the end of a while loop.
		
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
