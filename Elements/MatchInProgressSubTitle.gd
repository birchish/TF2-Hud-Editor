extends Control
"""		
"MatchInProgressSubTitle"
{
	"ControlName"		"Label"
	"fieldName"		"MatchInProgressSubTitle"
	"font"			"HudFontSmall"
	"labelText"		"#TF_Matchmaking_MatchInProgress_RestoringConnection"
	"xpos"		"cs-0.5"
	"ypos"		"140"
	"zpos"			"2"
	"wide"		"340"
	"tall"		"40"
	"textAlignment"	"center"
	"visible"	"1"
	"enabled"	"1"
	"proportionaltoparent"	"1"
}
"""
@export var Name = "\"MatchInProgressSubTitle\""
@export var ControlName = "\"Label\""
@export var fieldName = "\"MatchInProgressSubTitle\""
@export var font = "\"HudFontSmall\""
@export var labelText = "\"#TF_Matchmaking_MatchInProgress_RestoringConnection\""
@export var zpos = "\"1\"" # Height
@export var textAlignment = "\"Center\""
@export var vis = true
@export var enabled = true
# PosTest.position # Beginning
# PosTest.get_end() # End

func _ready():
	Report_Self()
	
func Report_Self():
	var report = "{0}\n{\n	\"ControlName\"	{1}"
	report.format(Name,ControlName)
	print(report.format([Name,ControlName]))
