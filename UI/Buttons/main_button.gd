extends TextureButton


export (String) var text
func _ready():
	get_child(0).text = text

