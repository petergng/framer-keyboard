setup = require "setup"
ime = require "ime"

bg = new BackgroundLayer

# todo cheating right now by setting input in window
# ideally i'd make a pointer in the class when a user selects a field
window.inputHistory = ''

window.TextField = new Text
	html: inputHistory
	midX: screenWidth/2
	midY: screenHeight/3
	width: screenWidth - 128
	fontFamily: 'sf'
	fontSize: 48
	textAlign: 'center'

ime.show()