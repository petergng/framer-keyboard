# framer-keyboard
Responsive keyboard and entry module for framer. Simulates key presses and stores input history. Built with no images and has some gems including classes for a quick material design icon font layer and an easy custom text layer.

# Demo
http://share.framerjs.com/rmgpk56obo36/

# Implement

<code>
setup = require "setup"
ime = require "ime"
</code>
<br>Includes the modules

<code>
window.inputHistory = ''
</code>
<br> this tracks the history of what keys you hit

<code>
window.TextField = new Text
	html: inputHistory
</code>
<br>this will display the input

<code>
ime.show()
</code>
<br>this will show the keyboard
