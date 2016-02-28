window.emo = "cubic-bezier(.4,0,.2,1)"
window.emoSpring = "spring(400,40,10)"
window.emoSpringMedium = "spring(200, 40, 10, .01)"
window.emoSpringLong = "spring(160, 80, 10)"

Framer.Defaults.Animation = curve: "spring(400,40,10)"
Framer.Defaults.Layer.shadowColor = 'rgba(0,0,0,0.12)'

window.screenWidth = Framer.Device.screen.width
window.screenHeight = Framer.Device.screen.height


# SF font
style = document.createElement('style');
style.type = 'text/css';
style.appendChild(document.createTextNode("@font-face {\n" +
"\tfont-family: \"sf\";\n" + 
"\tsrc: local(''), url('fonts/SF-UI-Text-Regular.otf') format('opentype');\n" + 
"}\n" + 
"\tfont-family: sf !important;\n" + 
"}\n"));
document.getElementsByTagName('head')[0].appendChild(style);

style = document.createElement('style');
style.type = 'text/css';
style.appendChild(document.createTextNode("@font-face {\n" +
"\tfont-family: \"sfLight\";\n" + 
"\tsrc: local(''), url('fonts/SF-UI-Text-Light.otf') format('opentype');\n" + 
"}\n" + 
"\tfont-family: sfLight !important;\n" + 
"}\n"));
document.getElementsByTagName('head')[0].appendChild(style);

class window.Text extends Layer
	constructor: (options) ->
		options.html = options.html || 'enter text'
		options.clip = options.clip || false
		options.color = options.color || "black"
		options.height = options.height || @fontSize
		options.backgroundColor = options.backgroundColor || 'transparent'

		super options
		@fontSize = options.fontSize || 28
		@width = options.width || 200
		@height = options.height || @fontSize * 2
		@textAlign = options.textAlign || 'left'
		@fontFamily = options.fontFamily || "sf"
		@lineHeight = options.lineHeight || @height
		@textTransform = options.textTransform || 'none'

		@style =
			"font-size": "#{@fontSize}px"
			"text-align": "#{@textAlign}"
			"line-height": "#{@.lineHeight}px"
			"font-family": "#{@.fontFamily}"
			"text-transform": "#{@textTransform}"

# Start md icons
style = document.createElement('style');
style.type = 'text/css';
style.appendChild(document.createTextNode("@font-face {\n" +
"\tfont-family: \"materialIcons\";\n" + 
"\tsrc: local(''), url('fonts/MaterialIcons-Regular.ttf') format('truetype');\n" + 
"}\n" + 
"\tfont-family: materialIcons !important;\n" + 
"}\n"));
document.getElementsByTagName('head')[0].appendChild(style);

class window.Icon extends Layer
	constructor: (options) ->
		options.width = options.width || 64
		options.height = options.height || 64
		options.html = options.html || 'face'
		options.color = options.color || "black"
		options.backgroundColor = options.backgroundColor || 'transparent'
		options.lineHeight = options.lineHeight || options.height

		super options
		@fontSize = options.fontSize || @width - 16
		
		@style =
			"font-family": "materialIcons"
			"font-size": "#{@fontSize}px"
			"text-align": 'center'
			"line-height": "#{options.lineHeight}px"