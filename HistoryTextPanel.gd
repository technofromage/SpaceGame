extends RichTextLabel

export var wordcount = 4
var cursor = 0
var words = []

func _ready():
	words.resize(wordcount)
	for i in range(wordcount):
		words[i]=""

func push_text(word):
	words[cursor] = word	#add word to array
	cursor = (cursor+1)%wordcount
	
	set_text("");#re-draw text
	for i in range(wordcount):
		set_text(get_text()+'\n'+words[(cursor+i)%wordcount])