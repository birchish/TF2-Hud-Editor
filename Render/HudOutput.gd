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

@onready var PosTest = $Control

func _ready():
	print(PosTest.position)
	print(PosTest.get_end())
