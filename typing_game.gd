extends Node


export (NodePath) onready var dialogue_text = get_node(dialogue_text) as RichTextLabel

var curr_char: int

var text = "i want to test this text"



func _ready():
	update_text()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_echo():
		var typed_event = event as InputEventKey
		var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()
		var next_character = text.substr(curr_char, 1)
		if key_typed == next_character:
			curr_char += 1
		update_text()


func update_text():
	dialogue_text.bbcode_text = "[color=gray]" + text.left(curr_char) + "[/color]" + "[u]" + text.substr(curr_char, 1) + "[/u]" + text.right(curr_char + 1)
