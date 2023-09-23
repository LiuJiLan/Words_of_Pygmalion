extends Object

const META_PATH: String = "res://data/meta_data.json"
const WDLS_PATH: String = "res://data/word_list.json"
const DICT_PATH: String = "res://data/dictionary.json"

var MetaData
var DictData = {}
var WordList = {}

func _init():
	super._init()
	read_meta()
	read_dict()
	read_wdls()
	

func _read_in_json(path: String):
	# load是内置函数名, 所以改为read_in()
	var file:FileAccess = FileAccess.open(path, FileAccess.READ)
	var res = JSON.parse_string(file.get_as_text())
	file.close()
	return res

func _write_back_json(path: String, val):
	var file:FileAccess = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(val))
	file.close()


func read_meta():
	var json_content = _read_in_json(META_PATH)
	self.MetaData = json_content

func write_meta():
	_write_back_json(META_PATH, self.MetaData)


func read_dict():
	var json_content = _read_in_json(DICT_PATH)
	var trans_str = "[b][i]{ps}[/i][/b] {trans}"
	for item in json_content.d:
		var key = item.wd
		var trans_str_ls = []
		for e in item.mn:
			trans_str_ls.append(trans_str.format(e))
		var explain_str = "\n".join(trans_str_ls)
		self.DictData[key] = explain_str


func write_dict():
	# Dictionary is no need to write back.
	pass

func read_wdls():
	var json_content = _read_in_json(WDLS_PATH)
	for item in json_content.wl:
		var key = item.idx
		self.WordList[key] = {"word": item.word, 
							"isknown": item.isknown, 
							"temp_isknown": item.isknown}


func write_wdls():
	var json_content = {"wl": []}
	for i in range(len(WordList)):
		json_content.wl.append({"idx": i, 
								"word": self.WordList[i].word, 
								"isknown": self.WordList[i].isknown})


