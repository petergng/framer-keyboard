{Key} = require "key"

# start input
#todo probably do voice input one day

# start keyboard yo
firstRow = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p']
secondRow = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
thirdRow = ['z', 'x', 'c', 'v', 'b', 'n', 'm']

exports.keyboard = new Layer
	y: screenHeight
	width: screenWidth
	height: 432
	backgroundColor: '#d0d3d9'

exports.keyboard.states.add
	hide: y: screenHeight
	show: maxY: screenHeight

keyPadding = 6
keyWidth = screenWidth / firstRow.length
keyHeight = exports.keyboard.height / 4

rowOne = new Layer
	parent: exports.keyboard
	midX: exports.keyboard.width/2
	y: 0
	width: firstRow.length * keyWidth
	height: keyHeight
	backgroundColor: 'transparent'

rowTwo = new Layer
	parent: exports.keyboard
	midX: exports.keyboard.width/2
	width: secondRow.length * keyWidth
	height: keyHeight
	backgroundColor: 'transparent'
	y: rowOne.maxY
	
rowThree = new Layer
	parent: exports.keyboard
	midX: exports.keyboard.width/2
	width: thirdRow.length * keyWidth
	height: keyHeight
	backgroundColor: 'transparent'
	y: rowTwo.maxY

rowFour = new Layer
	parent: exports.keyboard
	midX: exports.keyboard.width/2
	width: exports.keyboard.width
	height: keyHeight
	backgroundColor: 'transparent'
	y: rowThree.maxY


for letter, i in firstRow
	key = new Key
		parent: rowOne
		name: letter
		width: keyWidth
		height: keyHeight
		x: i * keyWidth
		y: 0

for letter, i in secondRow
	key = new Key
		parent: rowTwo
		name: letter
		width: keyWidth
		height: keyHeight
		x: i * keyWidth
		y: 0

for letter, i in thirdRow
	key = new Key
		parent: rowThree
		name: letter
		width: keyWidth
		height: keyHeight
		x: i * keyWidth
		y: 0

shift = new Key
	parent: rowThree
	maxX: 0
	width: (exports.keyboard.width - rowThree.width)/2 - keyPadding
	height: keyHeight
	type: 'icon'
	fontSize: 56
	name: 'file_upload'
	value: '^'
	backgroundColor: '#acb2bd'

backSpace = new Key
	parent: rowThree
	x: rowThree.width
	width: (exports.keyboard.width - rowThree.width)/2 - keyPadding
	height: keyHeight
	name: 'backspace'
	type: 'icon'
	backgroundColor: '#acb2bd'


space = new Key
	parent: rowFour
	name: ' '
	value: ' '
	grow: 1
	midX: exports.keyboard.width/2 + keyWidth/2
	fontSize: 28
	width: 4 * keyWidth
	height: keyHeight
	fontFamily: 'sf'

mic = new Key
	parent: rowFour
	maxX: space.x
	width: keyWidth
	height: keyHeight
	name: 'mic'
	type: 'icon'
	backgroundColor: '#acb2bd'

emoji = new Key
	parent: rowFour
	maxX: mic.x
	width: keyWidth
	height: keyHeight
	type: 'icon'
	name: 'tag_faces'
	value: '=)'
	backgroundColor: '#acb2bd'

num = new Key
	parent: rowFour
	name: '123'
	maxX: emoji.x
	width: emoji.x - keyPadding
	height: keyHeight
	fontSize: 32
	fontFamily: 'sf'
	backgroundColor: '#acb2bd'

enter = new Key
	parent: rowFour
	name: 'return'
	value: '<br>'
	grow: 1
	fontFamily: 'sf'
	x: space.maxX
	fontSize: 28
	width: exports.keyboard.width - space.maxX - keyPadding
	height: keyHeight
	backgroundColor: '#acb2bd'

exports.hide = () ->
	exports.keyboard.states.switch('hide', curve: emoSpring)

exports.show = () ->
	exports.keyboard.states.switch('show', delay: .2, curve: emoSpringMedium)
