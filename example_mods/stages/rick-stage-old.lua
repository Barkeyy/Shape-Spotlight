


function onCreate()
	makeLuaSprite('bg', 'plain', -300, -300)
	addLuaSprite('bg')
scaleObject('bg', 1.5, 1.5);
makeLuaSprite('multiply-this', 'multiply-this', -300, -300)
addLuaSprite('multiply-this')
scaleObject('multiply-this', 1.5, 1.5);
setBlendMode('multiply-this', 'multiply')
makeLuaSprite('multiply-this2', 'multiply-this-2', -300, -300)
addLuaSprite('multiply-this2',true)
scaleObject('multiply-this2', 1.5, 1.5);
setBlendMode('multiply-this2', 'multiply')

makeLuaSprite('bg2', 'lights-add', -300, -300)
setBlendMode('bg2', 'add')

addLuaSprite('bg2',true)
scaleObject('bg2', 1.5, 1.5);

end
	