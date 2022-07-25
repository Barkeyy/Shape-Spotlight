


function onCreate()
	makeLuaSprite('bg1', 'newbg/backstage', -300, -300)
	addLuaSprite('bg1')
	scaleObject('bg1', 1.52, 1.5);

	makeLuaSprite('bg2', 'newbg/people excalmation point', -300, -300)
	addLuaSprite('bg2')
	scaleObject('bg2', 1.5, 1.5);

	makeLuaSprite('bg3', 'newbg/front back', -300, -300)
	addLuaSprite('bg3')
	scaleObject('bg3', 1.5, 1.5);

	makeLuaSprite('bg4', 'newbg/back lights', -300, -300)
	addLuaSprite('bg4',true)
	scaleObject('bg4', 1.5, 1.5);

	makeLuaSprite('bg6', 'newbg/cool lights', -300, -300)
	setBlendMode('bg6', 'add')
	addLuaSprite('bg6',true)
	scaleObject('bg6', 1.5, 1.5);

	makeLuaSprite('bg7', 'newbg/frontal lights', -300, -300)
	setBlendMode('bg7', 'add')
	addLuaSprite('bg7',true)
	scaleObject('bg7', 1.5, 1.5);

	makeLuaSprite('lightsThatAreActivatedLater', 'newbg/cool lights left', -300, -300)
	setBlendMode('lightsThatAreActivatedLater', 'add')
	scaleObject('lightsThatAreActivatedLater', 1.5, 1.5);
	addLuaSprite('lightsThatAreActivatedLater',true)
	setProperty('lightsThatAreActivatedLater.alpha',0)

	makeLuaSprite('lights2', 'newbg/cool lights right', -300, -300)
	setBlendMode('lights2', 'add')
	scaleObject('lights2', 1.5, 1.5);
	addLuaSprite('lights2',true)

	setProperty('lights2.alpha',0)

end
