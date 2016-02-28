class exports.Key extends Layer
	constructor: (options) ->
		options.width = options.width || 64
		options.height = options.height || 64
		options.color = options.color || "black"
		options.backgroundColor = options.backgroundColor || 'white'
		options.borderRadius = 12
		@fontFamily = options.fontFamily || 'sfLight'

		super options
		@fontSize = options.fontSize || 48
		@type = options.type || 'letter'
		@value = options.value || @name
		@keyPadding = options.keyPadding || 6
		@grow = options.grow || 1.61

		if @type is 'letter'
			content = new Text
				parent: @
				html: @name
				midY: @height/2
				midX: @width/2
				textAlign: 'center'
				fontSize: @fontSize
				fontFamily: @fontFamily
				lineHeight: @height - 12 * 2
				height: @height - @keyPadding * 4
				width: @width - @keyPadding * 2
				backgroundColor: @backgroundColor
				borderRadius: @borderRadius
				shadowY: 4
				shadowColor: 'rgba(0,0,0,0.2)'

		else if @type is 'icon'
			content = new Icon
				parent: @
				fontSize: @fontSize
				html: @name
				midY: @height/2
				midX: @width/2
				height: @height - @keyPadding * 4
				width: @width - @keyPadding * 2
				backgroundColor: @backgroundColor
				borderRadius: @borderRadius
				shadowY: 4
				shadowColor: 'rgba(0,0,0,0.2)'

		#reset the globals
		@borderRadius = 0
		@backgroundColor = 'transparent'

		content.states.add
			normal:
				backgroundColor: content.backgroundColor
				x: content.x
				y: content.y
				width: content.width
				height: content.height
				shadowBlur: @shadowBlur
			pressed:
				backgroundColor: '#ddd'
				x: content.x - (((content.width * @grow) - content.width) / 2)
				y: content.y - content.height * @grow * @grow + content.height
				shadowBlur: 32
				width: content.width * @grow
				height: content.height * @grow * @grow
		
		@.on Events.TouchStart, ->
			this.bringToFront()
			content.states.switch('pressed', delay: 0, curve: "spring(600,50,45,.1)")
			
			# todo backspace is stupid and doesn't work
			if this.value is 'backspace'
				inputHistory.substring(1)
			else
				inputHistory += this.value
			TextField.html = inputHistory

		@.on Events.TouchEnd, ->
			content.states.switch('normal', delay: .01, curve: "spring(500,40,0,.1)")

