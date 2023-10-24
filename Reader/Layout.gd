extends Node
var Preamble = []
var Full_Array_Hud = {
	
}

func _ready():
	load_layout()
	save_layout()
	
func load_layout():
	var last_line
	var C_array = []
	var A_name = ""
	var in_asset_dict : bool = false
	
	if !FileAccess.file_exists("user://hudlayout.res"):
		print("No rayout.res file!")
		return 
		
	# Load the file line by line and process that dictionary to restore
	var F_layout = FileAccess.open("user://hudlayout.res",FileAccess.READ)
	
	
	while F_layout .get_position() < F_layout .get_length():
		var line = F_layout.get_line()
		
		if line =="{":
			while F_layout .get_position() < F_layout .get_length():
				line = F_layout.get_line()
				if line.contains("	{") and !line.contains("		"): # Remember "		if_vr" search in hudlayout.res
					
					A_name = last_line.replace("\t", "").replace("\"[", "\" [")
					
					in_asset_dict = true
					
					while(in_asset_dict):
						line = F_layout.get_line()
						
						if str(line) == "	}":
							in_asset_dict = false
							
						else:
							C_array.append(line.replace("\t", "").replace("\"\"","\" \"").replace("\"[", "\" ["))
					Full_Array_Hud[A_name] = C_array
					
					A_name = ""
					C_array = []
					
				last_line = line
		else:
			Preamble.append(line)
			
		
func save_layout():
	var F_layout = FileAccess.open("user://D_hudlayout.res",FileAccess.WRITE)
	var output = ""
	
	for I in Preamble:
		output += I + "\n"
		
	output += "{\n"
	
	for K in Full_Array_Hud.keys():
		output += "\t" + K + "\n\t{\n"
		for V in Full_Array_Hud[K]:
			output += "\t\t" + V + "\n"
		output += "\t" + "}\n\n"
	output += "}"
	
	F_layout.store_string(output)
